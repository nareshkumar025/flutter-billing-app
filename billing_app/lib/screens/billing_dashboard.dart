import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BillingDashboard extends StatelessWidget {
  const BillingDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildTabBar(),
            const SizedBox(height: 24),
            _buildDateFilter(),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: _buildRecurringRevenueCard()),
                const SizedBox(width: 16),
                Expanded(child: _buildOutstandingInvoicesCard()),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: _buildNetVolumeCard()),
                const SizedBox(width: 16),
                Expanded(child: _buildRevenueGrowthCard()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Text(
      'Billing',
      style: GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          _buildTab('Overview', true),
          _buildTab('Quotation', false),
          _buildTab('Invoice', false),
        ],
      ),
    );
  }

  Widget _buildTab(String text, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            color: isSelected ? Colors.white : Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildDateFilter() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Text(
                'Last 3 weeks',
                style: GoogleFonts.inter(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Text(
                '14 Aug - 04 Sep',
                style: GoogleFonts.inter(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(Icons.calendar_today, size: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecurringRevenueCard() {
    return _buildCard(
      title: 'Monthly Recurring Revenue',
      value: '5,873,500 IDR',
      growth: '+20%',
      chart: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 1),
                const FlSpot(1, 3),
                const FlSpot(2, 2),
                const FlSpot(3, 2.5),
                const FlSpot(4, 2),
                const FlSpot(5, 3),
                const FlSpot(6, 2.5),
              ],
              isCurved: true,
              color: Colors.green,
              barWidth: 2,
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOutstandingInvoicesCard() {
    return _buildCard(
      title: 'Outstanding Invoice',
      content: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Dr. Lillian Conn',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              'lillianconn@gmail.com',
              style: GoogleFonts.inter(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            trailing: Text(
              '\$1,290',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNetVolumeCard() {
    return _buildCard(
      title: 'Net Volume',
      value: '6,500 USD',
      growth: '+20%',
      chart: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 2),
                const FlSpot(1, 4),
                const FlSpot(2, 3),
                const FlSpot(3, 5),
                const FlSpot(4, 4),
                const FlSpot(5, 6),
                const FlSpot(6, 7),
              ],
              isCurved: true,
              color: Colors.green,
              barWidth: 2,
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRevenueGrowthCard() {
    return _buildCard(
      title: 'Monthly Recurring Revenue Growth',
      value: '3,698 USD',
      growth: '+20%',
      chart: BarChart(
        BarChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          barGroups: [
            BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 2)]),
            BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 3)]),
            BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 2)]),
            BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 1)]),
            BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 2)]),
            BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 3)]),
            BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 4)]),
          ],
          barTouchData: BarTouchData(enabled: false),
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    String? value,
    String? growth,
    Widget? chart,
    Widget? content,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (title != 'Outstanding Invoice')
                Icon(Icons.info_outline, size: 16, color: Colors.grey[600]),
            ],
          ),
          if (value != null) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  value,
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (growth != null) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      growth,
                      style: GoogleFonts.inter(
                        color: Colors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
          if (chart != null) ...[
            const SizedBox(height: 16),
            SizedBox(
              height: 100,
              child: chart,
            ),
          ],
          if (content != null) content,
          if (title == 'Outstanding Invoice') ...[
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: Text(
                'View All Invoice',
                style: GoogleFonts.inter(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
