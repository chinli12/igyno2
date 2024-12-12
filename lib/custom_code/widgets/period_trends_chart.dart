// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
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

  final barColor = Colors.blue;
  final betweenSpace = 0.2;

  @override
  void initState() {
    super.initState();
    trendsFuture = fetchCycleLengthTrends(widget.userRef);
  }

  Future<List<Map<String, dynamic>>> fetchCycleLengthTrends(
      DocumentReference userRef) async {
    try {
      final DateTime now = DateTime.now();
      final DateTime sixMonthsLater = now.add(const Duration(days: 180));

      final snapshot = await FirebaseFirestore.instance
          .collection("periodTrack")
          .where("owner", isEqualTo: userRef)
          .where("timeStamp", isGreaterThanOrEqualTo: Timestamp.fromDate(now))
          .where("timeStamp",
              isLessThanOrEqualTo: Timestamp.fromDate(sixMonthsLater))
          .orderBy("timeStamp")
          .get();

      return snapshot.docs.map((doc) {
        final data = doc.data();
        final date = (data['timeStamp'] as Timestamp).toDate();
        return {
          "monthYear": DateFormat("MMM yyyy").format(date),
          "cycleLength": data["CycleLength"] ?? 0,
        };
      }).toList();
    } catch (e) {
      debugPrint("Error fetching cycle length trends: $e");
      return [];
    }
  }

  BarChartGroupData generateGroupData(int x, double cycleLength) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: cycleLength,
          color: barColor,
          width: 5,
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta, List<String> labels) {
    const style = TextStyle(fontSize: 10);
    if (value >= 0 && value < labels.length) {
      return SideTitleWidget(
        axisSide: meta.axisSide,
        child: Text(labels[value.toInt()], style: style),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: trendsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error fetching trends."));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No trends available."));
        }

        final trends = snapshot.data!;

        final labels = trends.map((t) => t['monthYear'] as String).toList();
        final barGroups = trends.asMap().entries.map((entry) {
          final index = entry.key;
          final trend = entry.value;
          return generateGroupData(index, trend['cycleLength'].toDouble());
        }).toList();

        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cycle Length Trends',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              AspectRatio(
                aspectRatio: 2,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceBetween,
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, _) {
                            return Text(
                              value.toInt().toString(),
                              style: const TextStyle(fontSize: 10),
                            );
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) =>
                              bottomTitles(value, meta, labels),
                          reservedSize: 20,
                        ),
                      ),
                    ),
                    barTouchData: BarTouchData(enabled: false),
                    borderData: FlBorderData(show: false),
                    gridData: const FlGridData(show: false),
                    barGroups: barGroups,
                    maxY: trends
                            .map((t) => t['cycleLength'] as double)
                            .reduce((a, b) => a > b ? a : b) +
                        5,
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
