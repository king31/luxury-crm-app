import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedPeriod = 0;
  final List<String> _periods = ['اليوم', 'الأسبوع', 'الشهر', 'السنة'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      appBar: AppBar(
        title: const Text('لوحة التحكم التنفيذية'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () => _showNotifications(context),
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () => _showProfile(context),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => await Future.delayed(const Duration(seconds: 2)),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPeriodSelector(),
              const SizedBox(height: 16),
              _buildKPICards(),
              const SizedBox(height: 24),
              _buildSalesChart(),
              const SizedBox(height: 24),
              _buildPipelineStatus(),
              const SizedBox(height: 24),
              _buildQuickActions(),
              const SizedBox(height: 24),
              _buildRecentActivities(),
              const SizedBox(height: 24),
              _buildUpcomingTasks(),
              const SizedBox(height: 24),
              _buildTopCustomers(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPeriodSelector() {
    return Container(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _periods.length,
        itemBuilder: (context, index) {
          final isSelected = index == _selectedPeriod;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(_periods[index]),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  setState(() => _selectedPeriod = index);
                }
              },
              selectedColor: const Color(0xFFE94560),
              backgroundColor: Colors.white,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF6C757D),
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildKPICards() {
    final kpiData = [
      {
        'title': 'إجمالي المبيعات',
        'value': '2.4M',
        'change': '+12%',
        'icon': Icons.trending_up,
        'color': 0xFF28A745,
        'subtitle': 'مقارنة بالفترة السابقة'
      },
      {
        'title': 'العملاء النشطين',
        'value': '156',
        'change': '+8',
        'icon': Icons.business,
        'color': 0xFF17A2B8,
        'subtitle': 'مؤسسة جديدة هذا الشهر'
      },
      {
        'title': 'العقود النشطة',
        'value': '42',
        'change': '+3',
        'icon': Icons.assignment,
        'color': 0xFFE94560,
        'subtitle': 'قيمة: 8.5M ر.س'
      },
      {
        'title': 'معدل الرضا',
        'value': '94%',
        'change': '+2%',
        'icon': Icons.sentiment_satisfied,
        'color': 0xFFFFC107,
        'subtitle': 'NPS: 72'
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: kpiData.length,
      itemBuilder: (context, index) {
        final item = kpiData[index];
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(item['color'] as int).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        item['icon'] as IconData,
                        color: Color(item['color'] as int),
                        size: 24,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(item['color'] as int).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        item['change'] as String,
                        style: TextStyle(
                          color: Color(item['color'] as int),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['value'] as String,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                    Text(
                      item['title'] as String,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6C757D),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      item['subtitle'] as String,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFFADB5BD),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSalesChart() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'تحليل المبيعات',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward, size: 16),
                  label: const Text('التفاصيل'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildLegend('مبيعات الشركات', const Color(0xFF1A1A2E)),
                const SizedBox(width: 16),
                _buildLegend('مبيعات المؤسسات', const Color(0xFFE94560)),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 100,
                  barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: const Color(0xFF1A1A2E),
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          '${rod.toY.toInt()}K',
                          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const days = ['سبت', 'أحد', 'اثنين', 'ثلاثاء', 'أربعاء', 'خميس', 'جمعة'];
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              days[value.toInt()],
                              style: const TextStyle(fontSize: 10, color: Color(0xFF6C757D)),
                            ),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '${value.toInt()}K',
                            style: const TextStyle(fontSize: 10, color: Color(0xFFADB5BD)),
                          );
                        },
                        reservedSize: 40,
                      ),
                    ),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 20,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: const Color(0xFFEEEEEE),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    _makeBarGroup(0, 65, 45, const Color(0xFF1A1A2E), const Color(0xFFE94560)),
                    _makeBarGroup(1, 80, 60, const Color(0xFF1A1A2E), const Color(0xFFE94560)),
                    _makeBarGroup(2, 55, 35, const Color(0xFF1A1A2E), const Color(0xFFE94560)),
                    _makeBarGroup(3, 90, 75, const Color(0xFF1A1A2E), const Color(0xFFE94560)),
                    _makeBarGroup(4, 75, 55, const Color(0xFF1A1A2E), const Color(0xFFE94560)),
                    _makeBarGroup(5, 85, 65, const Color(0xFF1A1A2E), const Color(0xFFE94560)),
                    _makeBarGroup(6, 70, 50, const Color(0xFF1A1A2E), const Color(0xFFE94560)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegend(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(3)),
        ),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF6C757D))),
      ],
    );
  }

  BarChartGroupData _makeBarGroup(int x, double y1, double y2, Color color1, Color color2) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: y1, color: color1, width: 12, borderRadius: BorderRadius.circular(4)),
        BarChartRodData(toY: y2, color: color2, width: 12, borderRadius: BorderRadius.circular(4)),
      ],
    );
  }

  Widget _buildPipelineStatus() {
    final stages = [
      {'name': 'Lead', 'count': 45, 'value': 0.9, 'color': 0xFF6C757D},
      {'name': 'Qualified', 'count': 32, 'value': 0.64, 'color': 0xFF17A2B8},
      {'name': 'Meeting', 'count': 28, 'value': 0.56, 'color': 0xFFFFC107},
      {'name': 'Proposal', 'count': 18, 'value': 0.36, 'color': 0xFFFD7E14},
      {'name': 'Negotiation', 'count': 12, 'value': 0.24, 'color': 0xFFE94560},
      {'name': 'Won', 'count': 24, 'value': 0.48, 'color': 0xFF28A745},
      {'name': 'Lost', 'count': 8, 'value': 0.16, 'color': 0xFFDC3545},
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sales Pipeline',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list, size: 16),
                  label: const Text('تصفية'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...stages.map((stage) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Color(stage['color'] as int),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 80,
                    child: Text(
                      stage['name'] as String,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: stage['value'] as double,
                        backgroundColor: const Color(0xFFEEEEEE),
                        valueColor: AlwaysStoppedAnimation<Color>(Color(stage['color'] as int)),
                        minHeight: 8,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 30,
                    alignment: Alignment.center,
                    child: Text(
                      '${stage['count']}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    final actions = [
      {'icon': Icons.add_business, 'label': 'عميل جديد', 'color': 0xFF1A1A2E},
      {'icon': Icons.location_on, 'label': 'زيارة جديدة', 'color': 0xFFE94560},
      {'icon': Icons.description, 'label': 'عرض سعر', 'color': 0xFF17A2B8},
      {'icon': Icons.event, 'label': 'فعالية جديدة', 'color': 0xFFFFC107},
      {'icon': Icons.assignment, 'label': 'عقد جديد', 'color': 0xFF28A745},
      {'icon': Icons.task_alt, 'label': 'مهمة جديدة', 'color': 0xFF6C757D},
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'إجراءات سريعة',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: actions.length,
              itemBuilder: (context, index) {
                final action = actions[index];
                return InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(action['color'] as int).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          action['icon'] as IconData,
                          color: Color(action['color'] as int),
                          size: 32,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          action['label'] as String,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(action['color'] as int),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivities() {
    final activities = [
      {
        'icon': Icons.check_circle,
        'color': 0xFF28A745,
        'title': 'تم إغلاق صفقة مع شركة التقنية',
        'time': 'قبل 2 ساعة',
        'amount': '+450,000 ر.س',
        'type': 'won'
      },
      {
        'icon': Icons.location_on,
        'color': 0xFF17A2B8,
        'title': 'زيارة ميدانية - مستشفى الملك فهد',
        'time': 'قبل 4 ساعات',
        'amount': 'احتمالية عالية',
        'type': 'visit'
      },
      {
        'icon': Icons.description,
        'color': 0xFFFFC107,
        'title': 'عرض سعر جديد - مؤسسة التعليم',
        'time': 'قبل 6 ساعات',
        'amount': 'بانتظار الموافقة',
        'type': 'proposal'
      },
      {
        'icon': Icons.event,
        'color': 0xFFE94560,
        'title': 'فعالية شركات - منتدى الرياض',
        'time': 'قبل 8 ساعات',
        'amount': '120 شخص',
        'type': 'event'
      },
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'النشاطات الأخيرة',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('عرض الكل'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...activities.map((activity) => ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(activity['color'] as int).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  activity['icon'] as IconData,
                  color: Color(activity['color'] as int),
                  size: 20,
                ),
              ),
              title: Text(
                activity['title'] as String,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              subtitle: Text(
                activity['time'] as String,
                style: const TextStyle(fontSize: 12, color: Color(0xFFADB5BD)),
              ),
              trailing: Text(
                activity['amount'] as String,
                style: TextStyle(
                  color: Color(activity['color'] as int),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingTasks() {
    final tasks = [
      {'title': 'متابعة مع شركة النفط', 'time': '10:00 ص', 'type': 'اتصال', 'priority': 'عاجلة'},
      {'title': 'زيارة ميدانية - بنك الرياض', 'time': '14:00 م', 'type': 'زيارة', 'priority': 'عادية'},
      {'title': 'تقديم عرض سعر - جامعة الملك سعود', 'time': '16:00 م', 'type': 'اجتماع', 'priority': 'عاجلة'},
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'المهام القادمة',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('عرض الكل'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...tasks.map((task) => ListTile(
              leading: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: (task['priority'] == 'عاجلة' ? const Color(0xFFDC3545) : const Color(0xFF17A2B8)).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    task['time'] as String,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: task['priority'] == 'عاجلة' ? const Color(0xFFDC3545) : const Color(0xFF17A2B8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              title: Text(
                task['title'] as String,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              subtitle: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      task['type'] as String,
                      style: const TextStyle(fontSize: 11, color: Color(0xFF6C757D)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (task['priority'] == 'عاجلة')
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDC3545).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'عاجلة',
                        style: TextStyle(fontSize: 11, color: Color(0xFFDC3545), fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
              ),
              trailing: const Icon(Icons.chevron_left, color: Color(0xFFADB5BD)),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildTopCustomers() {
    final customers = [
      {'name': 'أرامكو السعودية', 'sector': 'نفط وغاز', 'value': '2.1M', 'growth': '+15%'},
      {'name': 'STC', 'sector': 'اتصالات', 'value': '1.8M', 'growth': '+12%'},
      {'name': 'الراجحي', 'sector': 'مصارف', 'value': '1.5M', 'growth': '+8%'},
      {'name': 'سابك', 'sector': 'بتروكيماويات', 'value': '1.2M', 'growth': '+10%'},
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'أعلى العملاء',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('عرض الكل'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            DataTable(
              columnSpacing: 20,
              columns: const [
                DataColumn(label: Text('المؤسسة', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('القطاع', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('القيمة', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('النمو', style: TextStyle(fontWeight: FontWeight.bold))),
              ],
              rows: customers.map((customer) => DataRow(
                cells: [
                  DataCell(Text(customer['name'] as String, style: const TextStyle(fontWeight: FontWeight.w600))),
                  DataCell(Text(customer['sector'] as String)),
                  DataCell(Text(customer['value'] as String, style: const TextStyle(fontWeight: FontWeight.bold))),
                  DataCell(Text(
                    customer['growth'] as String,
                    style: const TextStyle(color: Color(0xFF28A745), fontWeight: FontWeight.bold),
                  )),
                ],
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _showNotifications(BuildContext context) {
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
            const Text('الإشعارات', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.warning, color: Color(0xFFFFC107)),
              title: const Text('عقد قارب على الانتهاء'),
              subtitle: const Text('عقد أرامكو ينتهي خلال 30 يوم'),
              trailing: const Text('الآن', style: TextStyle(color: Color(0xFFADB5BD))),
            ),
            ListTile(
              leading: const Icon(Icons.task, color: Color(0xFF17A2B8)),
              title: const Text('مهمة جديدة مُسندة إليك'),
              subtitle: const Text('زيارة ميدانية - بنك الرياض'),
              trailing: const Text('قبل 5 دق', style: TextStyle(color: Color(0xFFADB5BD))),
            ),
          ],
        ),
      ),
    );
  }

  void _showProfile(BuildContext context) {
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
            const CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xFF1A1A2E),
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text('أحمد محمد', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text('مدير العلاقات الخارجية', style: TextStyle(color: Color(0xFF6C757D))),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('الإعدادات'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Color(0xFFDC3545)),
              title: const Text('تسجيل الخروج', style: TextStyle(color: Color(0xFFDC3545))),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
