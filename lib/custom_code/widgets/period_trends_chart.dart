// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class PeriodTrendsChart extends StatefulWidget {
  const PeriodTrendsChart({
    super.key,
    this.width,
    this.height,
    required this.userRef,
  });

  final double? width;
  final double? height;
  final DocumentReference userRef;

  @override
  State<PeriodTrendsChart> createState() => _PeriodTrendsChartState();
}

class _PeriodTrendsChartState extends State<PeriodTrendsChart> {
  late Future<List<Map<String, dynamic>>> trendsFuture;

  final Color leftBarColor = const Color(0xFFFF69B4); // Pink bar
  final Color rightBarColor = const Color(0xFFF1CDE0); // Light purple bar
  final double barWidth = 8; // Bar thickness

  @override
  void initState() {
    super.initState();
    trendsFuture = fetchCycleLengthTrends(widget.userRef);
  }

  Future<List<Map<String, dynamic>>> fetchCycleLengthTrends(
      DocumentReference userRef) async {
    try {
      final DateTime now = DateTime.now();
      final DateTime sixMonthsAgo = now.subtract(const Duration(days: 180));

      final snapshot = await FirebaseFirestore.instance
          .collection("periodTrack")
          .where("owner", isEqualTo: userRef)
          .where("timeStamp",
              isGreaterThanOrEqualTo: Timestamp.fromDate(sixMonthsAgo))
          .where("timeStamp", isLessThanOrEqualTo: Timestamp.fromDate(now))
          .orderBy("timeStamp")
          .get();

      return snapshot.docs.map((doc) {
        final data = doc.data();
        final date = (data['timeStamp'] as Timestamp?)?.toDate();
        return {
          "monthYear":
              date != null ? DateFormat("MMM yyyy").format(date) : "N/A",
          "cycleLength": data["CycleLength"] ?? 0,
          "duration":
              data["PeriodLength"] ?? 0, // Ensure this key exists or fallback
        };
      }).toList();
    } catch (e) {
      debugPrint("Error fetching cycle length trends: $e");
      return [];
    }
  }

  BarChartGroupData makeGroupData(int x, double cycleLength, double duration) {
    return BarChartGroupData(
      x: x,
      barsSpace: 6,
      barRods: [
        BarChartRodData(
          toY: cycleLength,
          color: leftBarColor,
          width: barWidth,
          borderRadius: BorderRadius.zero,
        ),
        BarChartRodData(
          toY: duration,
          color: rightBarColor,
          width: barWidth,
          borderRadius: BorderRadius.zero,
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta, List<String> labels) {
    const style = TextStyle(fontSize: 10, fontWeight: FontWeight.bold);
    if (value.toInt() < 0 || value.toInt() >= labels.length) return Container();
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        labels[value.toInt()],
        style: style,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: trendsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError ||
            !snapshot.hasData ||
            snapshot.data!.isEmpty) {
          return const Center(child: Text("No data available."));
        }

        final trends = snapshot.data!;
        final labels = trends.map((t) => t['monthYear'] as String).toList();

        final barGroups = trends.asMap().entries.map((entry) {
          final index = entry.key;
          final trend = entry.value;
          return makeGroupData(
            index,
            (trend['cycleLength'] as num).toDouble(),
            (trend['duration'] as num).toDouble(),
          );
        }).toList();

        final maxY = trends
            .map((t) => (t['cycleLength'] as num).toDouble())
            .reduce((a, b) => a > b ? a : b);

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              AspectRatio(
                aspectRatio: 2,
                child: BarChart(
                  BarChartData(
                    maxY: maxY + 5, // Add buffer to the maximum Y value
                    barGroups: barGroups,
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) =>
                              bottomTitles(value, meta, labels),
                          reservedSize: 24,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          getTitlesWidget: (value, _) => Text(
                            '${value.toInt()}',
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          return BarTooltipItem(
                            rod.toY.toString(),
                            const TextStyle(color: Colors.white),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
