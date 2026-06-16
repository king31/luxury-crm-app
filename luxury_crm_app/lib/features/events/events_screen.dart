import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final List<Map<String, dynamic>> _events = [
    {
      'name': 'مؤتمر التقنية 2024',
      'type': 'مؤتمر',
      'date': '2024-02-15',
      'time': '09:00 ص - 17:00 م',
      'location': 'مركز الملك فهد الثقافي',
      'organization': 'STC',
      'personCount': 500,
      'status': 'confirmed',
      'value': '125,000 ر.س',
    },
    {
      'name': 'حفل تدشين منتج جديد',
      'type': 'حفل',
      'date': '2024-02-20',
      'time': '19:00 م - 23:00 م',
      'location': 'فندق الفيصلية',
      'organization': 'أرامكو السعودية',
      'personCount': 200,
      'status': 'planned',
      'value': '85,000 ر.س',
    },
    {
      'name': 'ورشة عمل تدريبية',
      'type': 'ورشة عمل',
      'date': '2024-03-01',
      'time': '08:00 ص - 16:00 م',
      'location': 'مركز التدريب',
      'organization': 'سابك',
      'personCount': 50,
      'status': 'pending',
      'value': '35,000 ر.س',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      appBar: AppBar(
        title: const Text('الفعاليات والمناسبات'),
        actions: [
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
          IconButton(icon: const Icon(Icons.calendar_today), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _events.length,
        itemBuilder: (context, index) {
          final event = _events[index];
          return _buildEventCard(event);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddEventDialog(),
        icon: const Icon(Icons.event),
        label: const Text('فعالية جديدة'),
      ),
    );
  }

  Widget _buildEventCard(Map<String, dynamic> event) {
    Color statusColor;
    String statusText;
    switch (event['status']) {
      case 'confirmed':
        statusColor = const Color(0xFF28A745);
        statusText = 'مؤكدة';
        break;
      case 'planned':
        statusColor = const Color(0xFF17A2B8);
        statusText = 'مخططة';
        break;
      default:
        statusColor = const Color(0xFFFFC107);
        statusText = 'معلقة';
    }

    Color typeColor;
    switch (event['type']) {
      case 'مؤتمر':
        typeColor = const Color(0xFF1A1A2E);
        break;
      case 'حفل':
        typeColor = const Color(0xFFE94560);
        break;
      case 'ورشة عمل':
        typeColor = const Color(0xFF17A2B8);
        break;
      default:
        typeColor = const Color(0xFF6C757D);
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => _showEventDetails(event),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: typeColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: typeColor.withOpacity(0.3)),
                    ),
                    child: Text(
                      event['type'],
                      style: TextStyle(color: typeColor, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: statusColor.withOpacity(0.3)),
                    ),
                    child: Text(
                      statusText,
                      style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                event['name'],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E)),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.business, size: 16, color: Color(0xFF6C757D)),
                  const SizedBox(width: 4),
                  Text(event['organization'], style: const TextStyle(fontSize: 14, color: Color(0xFF6C757D))),
                ],
              ),
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildInfoColumn(Icons.calendar_today, event['date'], 'التاريخ'),
                  _buildInfoColumn(Icons.access_time, event['time'], 'الوقت'),
                  _buildInfoColumn(Icons.location_on, event['location'], 'الموقع'),
                  _buildInfoColumn(Icons.people, '${event['personCount']}', 'الأشخاص'),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('القيمة الإجمالية:', style: TextStyle(fontWeight: FontWeight.w600)),
                    Text(
                      event['value'],
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF28A745), fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoColumn(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, size: 20, color: const Color(0xFFADB5BD)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
        Text(label, style: const TextStyle(fontSize: 10, color: Color(0xFFADB5BD))),
      ],
    );
  }

  void _showEventDetails(Map<String, dynamic> event) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.8,
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
                  decoration: BoxDecoration(color: const Color(0xFFADB5BD), borderRadius: BorderRadius.circular(2)),
                ),
              ),
              const SizedBox(height: 16),
              Text(event['name'], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              _buildDetailSection('معلومات الفعالية', [
                _buildDetailRow(Icons.business, 'المؤسسة', event['organization']),
                _buildDetailRow(Icons.category, 'النوع', event['type']),
                _buildDetailRow(Icons.calendar_today, 'التاريخ', event['date']),
                _buildDetailRow(Icons.access_time, 'الوقت', event['time']),
                _buildDetailRow(Icons.location_on, 'الموقع', event['location']),
                _buildDetailRow(Icons.people, 'عدد الأشخاص', '${event['personCount']}'),
              ]),
              _buildDetailSection('التفاصيل المالية', [
                _buildDetailRow(Icons.attach_money, 'القيمة الإجمالية', event['value']),
                _buildDetailRow(Icons.payment, 'طريقة الدفع', 'تحويل بنكي'),
                _buildDetailRow(Icons.receipt, 'حالة الدفع', 'مدفوع 50%'),
              ]),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                      label: const Text('تعديل'),
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF17A2B8)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.picture_as_pdf),
                      label: const Text('تقرير'),
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFDC3545)),
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

  void _showAddEventDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('إضافة فعالية جديدة'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(decoration: const InputDecoration(labelText: 'اسم الفعالية')),
              const SizedBox(height: 16),
              TextField(decoration: const InputDecoration(labelText: 'النوع')),
              const SizedBox(height: 16),
              TextField(decoration: const InputDecoration(labelText: 'المؤسسة')),
              const SizedBox(height: 16),
              TextField(decoration: const InputDecoration(labelText: 'التاريخ')),
              const SizedBox(height: 16),
              TextField(decoration: const InputDecoration(labelText: 'الوقت')),
              const SizedBox(height: 16),
              TextField(decoration: const InputDecoration(labelText: 'الموقع')),
              const SizedBox(height: 16),
              TextField(decoration: const InputDecoration(labelText: 'عدد الأشخاص')),
              const SizedBox(height: 16),
              TextField(decoration: const InputDecoration(labelText: 'القيمة')),
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
