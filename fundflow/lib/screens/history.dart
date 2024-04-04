import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryReport extends StatefulWidget {
  const HistoryReport({super.key});

  @override
  State<HistoryReport> createState() => _HistoryReportState();
}

class _HistoryReportState extends State<HistoryReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('per month'),
                      Text('vs previous month')
                    ],
                  ),
                  Container(
                    height: 250,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: 20,
                            color: Colors.greenAccent
                          ),
                          PieChartSectionData(
                            value: 30,
                            color: Colors.lightBlue
                          ),
                          PieChartSectionData(
                            value: 60,
                            color: Colors.yellow
                          ),
                          PieChartSectionData(
                            value: 40,
                            color: Colors.orange
                          ),
                          PieChartSectionData(
                            value: 200,
                            color: Colors.red
                          ),
                        ]
                      )
                    ),
                  )
                ],
              ),
            ),
          )
    );
  }
}