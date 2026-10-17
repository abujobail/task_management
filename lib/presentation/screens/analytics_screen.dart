import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  String selectedTab = 'daily';

  BarChartGroupData _makeBarGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      // Sets the position of the bar on the horizontal axis
      showingTooltipIndicators: const [0],
      // Keeps the number visible on top of the this rod at all times
      barRods: [
        BarChartRodData(
          toY: y,
          // Sets the height of the main colored this bar,jeheto proti ta bar er jonno ekta custom method tai ekbar kore sobay asbe ekhane
          width: 18,
          // Makes the bar thicker for a modern look
          gradient: const LinearGradient(
            colors: [
              Color(0xFF818CF8),
              // 1st color: Bright neon-indigo for the top of the bar
              Color(0xFF38BDF8),
            ],
            stops: [0.4, 1.0],
            begin: Alignment.topCenter,
            // Gradient starts from the top middle of the bar
            end: Alignment
                .bottomCenter, // Gradient ends at the bottom middle of the bar
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6),
            // Rounds the top-left corner by 6 pixels
            topRight: Radius.circular(6),
          ),
          //Your iconic gray background progress bar block
          backDrawRodData: BackgroundBarChartRodData(
            show: true, // Enables the background bar visibility
            toY: 10, // Sets the maximum height of the background bar to 10
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> bottomAxisLabels =
        selectedTab ==
            'daily' //x axis dynamically handle
        ? const ['sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri']
        : const [
            'week 1',
            'week 2',
            'week 3',
            'week 4',
            'week 5',
            'week 6',
            'week 7',
          ];

    List<double> dailyTasksCounts = [5.0, 7.0, 4.0, 8.0, 2.0, 6.0, 9.0];
    List<double> dailyWeeklyCounts = [25.0, 40.0, 35.0, 50.0, 20.0, 45.0, 30.0];
    List<double> activeTaskData = selectedTab == 'daily'
        ? dailyTasksCounts
        : dailyWeeklyCounts;
    Color dailyColor = selectedTab == 'daily'
        ? const Color(0xFF6366F1)
        : const Color(0xFF475569);
    Color weeklyColor = selectedTab == 'weekly'
        ? const Color(0xFF6366F1)
        : const Color(0xFF475569);
    //border stroke
    Color dailyBorder = selectedTab == 'daily'
        ? Colors.blue
        : Colors.transparent;
    Color weeklyBorder = selectedTab == 'weekly'
        ? Colors.blue
        : Colors.transparent;
    String completeCount = selectedTab == 'daily' ? '24' : '145';
    String remainingCount = selectedTab == 'daily' ? '8' : '32';
    String percentDaily = selectedTab == 'daily' ? '75%' : '85%';
    double dynamicMaxY=  selectedTab == 'daily' ? 12 :60;

    return Scaffold(
      appBar: AppBar(
        title: Text('Analytics'),
        centerTitle: true,
        backgroundColor:Colors.lightGreenAccent.withOpacity(0.3),
      ),

      backgroundColor: Color(0xFF0F172A),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 35, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Your Productivity',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 45),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = 'daily';
                    });
                  },
                  child: Container(
                    width: 130,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: dailyBorder, width: 2.5),

                      // color: Colors.black45,
                    ),
                    child: Center(
                      child: Text(
                        "Daily",
                        style: TextStyle(
                          color: dailyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 80),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = 'weekly';
                    });
                  },
                  child: Container(
                    width: 130,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: weeklyBorder, width: 2.5),
                    ),
                    child: Center(
                      child: Text(
                        "Weekly",
                        style: TextStyle(
                          color: weeklyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: dynamicMaxY,

                    //x axis line and y axis line thickness
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(
                      show: true,
                      border: const Border(
                        left: BorderSide(
                          color: Color(0xFF475569),
                          // Slate gray color for the Y-axis line
                          width: 1.5, // Sets the thickness of the Y-axis line
                        ),
                        bottom: BorderSide(
                          color: Color(0xFF475569),
                          // Slate gray color for the X-axis line
                          width: 1.5, // Sets the thickness of the X-axis line
                        ),
                        top: BorderSide.none,
                        right: BorderSide.none,
                      ),
                    ),

                    barTouchData: BarTouchData(
                      enabled: true,
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipColor: (group) => Colors.transparent,
                        tooltipMargin: 4,//space between tooltip number and bar
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          return BarTooltipItem(
                            rod.toY.toInt().toString(),
                            const TextStyle(
                              color: Colors.white70, // সংখ্যার কালার
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          );
                        },
                      ),
                    ),
                    titlesData: FlTitlesData(
                      //এটি চার্টের চারপাশের অক্ষের (Axis) লেখা বা লেবেল নিয়ন্ত্রণ করার মূল সুইচ। এটি true করার মানে হলো আমরা চার্টের চারপাশে কাস্টম লেখা দেখাতে চাই।
                      show: true,
                      // Enables the visibility of titles around the chart
                      bottomTitles: AxisTitles(
                        // 🌟 Bottom axis titles block (for days of the week)
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            int index = value.toInt();
                            if (index < 0 || index >= bottomAxisLabels.length) {
                              return const SizedBox.shrink(); // Returns an empty invisible widget if out of bounds
                            }
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                bottomAxisLabels[index],
                                style: const TextStyle(
                                  color: Color(0xFF94A3B8),
                                  // সুন্দর হালকা অ্যাশ কালার
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 20,
                          interval: 4,
                          getTitlesWidget: (double value, TitleMeta) {
                            return Text(
                              value.toInt().toString(),
                              style: const TextStyle(
                                color: Color(0xFF94A3B8),
                                fontSize: 12,
                              ),
                            );
                          },
                        ),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),

                    barGroups: [
                      _makeBarGroup(0, activeTaskData[0]),
                      // Saturday data from the active list
                      _makeBarGroup(1, activeTaskData[1]),
                      // Sunday data
                      _makeBarGroup(2, activeTaskData[2]),
                      // Monday data
                      _makeBarGroup(3, activeTaskData[3]),
                      // Tuesday data
                      _makeBarGroup(4, activeTaskData[4]),
                      // Wednesday data
                      _makeBarGroup(5, activeTaskData[5]),
                      // Thursday data
                      _makeBarGroup(6, activeTaskData[6]),
                      // Friday data
                    ],
                  ),
                  duration: Duration(milliseconds: 150), // Optional
                  curve: Curves.bounceOut,
                ),
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text(
                      'completed',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      completeCount,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 32,
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    const Text(
                      'remaining',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      remainingCount,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 32,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Completion Rate',
                    style: TextStyle(color: Colors.grey, fontSize: 22),
                  ),
                  SizedBox(height: 12),
                  Text(
                    percentDaily,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
