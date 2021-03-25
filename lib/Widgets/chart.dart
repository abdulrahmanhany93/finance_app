import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
class Chart extends StatelessWidget {
  Chart(this.maxX,this.maxY, this.minX, this.minY, this.points);
  final double maxX;
  final double maxY;
  final double minX;
  final double minY;
  final List<FlSpot> points;

  @override
  Widget build(BuildContext context) {
     return LineChart(
        LineChartData(
          titlesData: FlTitlesData(show: false),
          gridData: FlGridData(
            show: false,
          ),
          maxX: maxX,
          maxY: maxY,
          minX: minX,
          minY: minY,
          lineBarsData: [
            LineChartBarData(
                belowBarData: BarAreaData(
                    show: true,
                    colors: [
                      Color(0xff251106),
                      Color(0xff4C230E),
                      Color(0xffBA5622)
                    ],
                    gradientFrom: Offset(0.8,1.2)),
                isCurved: true,
                barWidth: 5,
                shadow:Shadow(color: Colors.white,blurRadius: 2) ,

                colors: [Colors.deepOrange],
                spots: points)
          ],
        ),
      );

  }
}
