import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'الكل';
  final List<String> _filters = ['الكل', 'جديدة', 'قيد التنفيذ', 'معلقة', 'مكتملة'];

  final List<Map<String, dynamic>> _tasks = [
    {
      'title': 'متابعة مع شركة النفط',
      'type': 'اتصال',
      'priority': 'urgent',
      'status': 'new',
      'dueDate': '2024-01-15',
      'dueTime': '10:00 ص',
      'organization': 'أرامكو السعودية',
      'assignedTo': 'أحمد',
      'description': 'متابعة عرض السعر المقدم وتحديد موعد الاجتماع',
    },
    {
      'title': 'زيارة ميدانية - بنك الرياض',
      'type': 'زيارة',
      'priority': 'normal',
      'status': 'in_progress',
      'dueDate': '2024-01-16',
      'dueTime': '14:00 م',
      'organization': 'بنك الرياض',
      'assignedTo': 'أحمد',
      'description': 'تقييم جودة الخدمة الحالية ومناقشة التجديد',
    },
    {
      'title': 'تقديم عرض سعر - جامعة الملك سعود',
      'type': 'اجتماع',
      'priority': 'urgent',
      'status': 'pending',
      'dueDate': '2024-01-17',
      'dueTime': '16:00 م',
      'organization': 'جامعة الملك سعود',
      'assignedTo': 'خالد',
      'description': 'عرض خدمات الضيافة للفعاليات الجامعية',
    },
    {
      'title': 'تحصيل مستحقات - STC',
      'type': 'تحصيل',
      'priority': 'normal',
      'status': 'completed',
      'dueDate': '2024-01-14',
      'dueTime': '09:00 ص',
      'organization': 'STC',
      'assignedTo': 'محمد',
      'description': 'متابعة تحصيل الفاتورة رقم 2345',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      appBar: AppBar(
        title: const Text('إدارة المهام'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterBottomSheet(),
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => _showCalendarView(),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'بحث عن مهمة...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => setState(() => _searchController.clear()),
                      )
                    : null,
              ),
              onChanged: (value) => setState(() {}),
            ),
          ),
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _filters.length,
              itemBuilder: (context, index) {
                final isSelected = _filters[index] == _selectedFilter;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(_filters[index]),
                    selected: isSelected,
                    onSelected: (selected) {
                      if (selected) setState(() => _selectedFilter = _filters[index]);
                    },
                    selectedColor: const Color(0xFF1A1A2E),
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : const Color(0xFF6C757D),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return _buildTaskCard(task);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddTaskDialog(),
        icon: const Icon(Icons.add_task),
        label: const Text('مهمة جديدة'),
      ),
    );
  }

  Widget _buildTaskCard(Map<String, dynamic> task) {
    Color priorityColor;
    String priorityText;
    switch (task['priority']) {
      case 'urgent':
        priorityColor = const Color(0xFFDC3545);
        priorityText = 'عاجلة';
        break;
      case 'normal':
        priorityColor = const Color(0xFF17A2B8);
        priorityText = 'عادية';
        break;
      default:
        priorityColor = const Color(0xFF6C757D);
        priorityText = 'لاحقاً';
    }

    Color statusColor;
    String statusText;
    IconData statusIcon;
    switch (task['status']) {
      case 'completed':
        statusColor = const Color(0xFF28A745);
        statusText = 'مكتملة';
        statusIcon = Icons.check_circle;
        break;
      case 'in_progress':
        statusColor = const Color(0xFFFFC107);
        statusText = 'قيد التنفيذ';
        statusIcon = Icons.timelapse;
        break;
      case 'pending':
        statusColor = const Color(0xFFFD7E14);
        statusText = 'معلقة';
        statusIcon = Icons.pause_circle;
        break;
      default:
        statusColor = const Color(0xFF6C757D);
        statusText = 'جديدة';
        statusIcon = Icons.circle;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _showTaskDetails(task),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1A2E),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          task['organization'],
                          style: const TextStyle(fontSize: 12, color: Color(0xFF6C757D)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: priorityColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      priorityText,
                      style: TextStyle(color: priorityColor, fontWeight: FontWeight.bold, fontSize: 11),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(statusIcon, size: 14, color: statusColor),
                        const SizedBox(width: 4),
                        Text(statusText, style: TextStyle(fontSize: 11, color: statusColor, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.calendar_today, size: 14, color: Color(0xFF6C757D)),
                        const SizedBox(width: 4),
                        Text('${task['dueDate']}', style: const TextStyle(fontSize: 11, color: Color(0xFF6C757D))),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.access_time, size: 14, color: Color(0xFF6C757D)),
                        const SizedBox(width: 4),
                        Text('${task['dueTime']}', style: const TextStyle(fontSize: 11, color: Color(0xFF6C757D))),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 14,
                    backgroundColor: Color(0xFF1A1A2E),
                    child: Icon(Icons.person, size: 16, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  Text('مسندة إلى: ${task['assignedTo']}', style: const TextStyle(fontSize: 12, color: Color(0xFF6C757D))),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit, size: 16),
                    label: const Text('تعديل', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTaskDetails(Map<String, dynamic> task) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.95,
        minChildSize: 0.5,
        expand: false,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            controller: scrollController,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFADB5BD),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(task['title'], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              _buildDetailSection('معلومات المهمة', [
                _buildDetailRow(Icons.business, 'المؤسسة', task['organization']),
                _buildDetailRow(Icons.category, 'النوع', task['type']),
                _buildDetailRow(Icons.calendar_today, 'تاريخ الاستحقاق', task['dueDate']),
                _buildDetailRow(Icons.access_time, 'وقت الاستحقاق', task['dueTime']),
                _buildDetailRow(Icons.person, 'مسندة إلى', task['assignedTo']),
              ]),
              _buildDetailSection('الوصف', [
                ListTile(
                  leading: const Icon(Icons.notes, color: Color(0xFF6C757D)),
                  title: Text(task['description']),
                ),
              ]),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.check),
                      label: const Text('إكمال'),
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF28A745)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      label: const Text('تعديل'),
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF17A2B8)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E))),
        const SizedBox(height: 8),
        ...children,
        const Divider(height: 32),
      ],
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF6C757D)),
      title: Text(label, style: const TextStyle(fontSize: 14, color: Color(0xFF6C757D))),
      subtitle: Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF1A1A2E))),
    );
  }

  void _showCalendarView() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('تقويم المهام', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Container(
              height: 300,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 1,
                ),
                itemCount: 30,
                itemBuilder: (context, index) {
                  final day = index + 1;
                  final hasTask = day == 15 || day == 16 || day == 17;
                  return Container(
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: hasTask ? const Color(0xFFE94560).withOpacity(0.2) : null,
                      borderRadius: BorderRadius.circular(8),
                      border: hasTask ? Border.all(color: const Color(0xFFE94560)) : null,
                    ),
                    child: Center(
                      child: Text(
                        '$day',
                        style: TextStyle(
                          fontWeight: hasTask ? FontWeight.bold : FontWeight.normal,
                          color: hasTask ? const Color(0xFFE94560) : const Color(0xFF1A1A2E),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('تصفية المهام', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: _filters.map((filter) => FilterChip(
                label: Text(filter),
                selected: _selectedFilter == filter,
                onSelected: (selected) {
                  setState(() => _selectedFilter = filter);
                  Navigator.pop(context);
                },
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('إضافة مهمة جديدة'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(decoration: const InputDecoration(labelText: 'عنوان المهمة')),
              const SizedBox(height: 16),
              TextField(decoration: const InputDecoration(labelText: 'المؤسسة')),
              const SizedBox(height: 16),
              TextField(decoration: const InputDecoration(labelText: 'النوع')),
              const SizedBox(height: 16),
              TextField(decoration: const InputDecoration(labelText: 'التاريخ')),
              const SizedBox(height: 16),
              TextField(decoration: const InputDecoration(labelText: 'الوقت')),
              const SizedBox(height: 16),
              TextField(decoration: const InputDecoration(labelText: 'الوصف'), maxLines: 3),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
          ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('حفظ')),
        ],
      ),
    );
  }
}
