
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/// chart of income vs expense
class IncomeVsExpenseChart extends StatelessWidget {
  /// constructor
  const IncomeVsExpenseChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  const TextStyle style = TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  );
                  Widget text;
                  switch (value.toInt()) {
                    case 1:
                      text = const Text('Day 1', style: style);
                      break;
                    case 2:
                      text = const Text('Day 2', style: style);
                      break;
                    case 3:
                      text = const Text('Day 3', style: style);
                      break;
                    case 4:
                      text = const Text('Day 4', style: style);
                      break;
                    case 5:
                      text = const Text('Day 5', style: style);
                      break;
                    case 6:
                      text = const Text('Day 6', style: style);
                      break;
                    case 7:
                      text = const Text('Day 7', style: style);
                      break;
                    default:
                      text = const Text('', style: style);
                      break;
                  }
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: text,
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  const TextStyle style = TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  );
                  String text;
                  switch (value.toInt()) {
                    case 1:
                      text = r'$1k';
                      break;
                    case 2:
                      text = r'$2k';
                      break;
                    case 3:
                      text = r'$3k';
                      break;
                    default:
                      return Container();
                  }
                  return Text(text, style: style, textAlign: TextAlign.left);
                },
                reservedSize: 32,
                // margin: 12,
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d)),
          ),
          minX: 0,
          maxX: 7,
          minY: 0,
          maxY: 4,
          lineBarsData: <LineChartBarData>[
            commonChartBar(list: <FlSpot>[
              const FlSpot(0, 3),
              const FlSpot(1, 1),
              const FlSpot(2, 2),
              const FlSpot(3, 3.1),
              const FlSpot(4, 2.5),
              const FlSpot(5, 2.5),
              const FlSpot(6, 2),
              const FlSpot(7, 1.8),
            ],color: Colors.blue),
            commonChartBar(list: <FlSpot>[
              const FlSpot(0, 1),
              const FlSpot(1, 2.5),
              const FlSpot(2, 1.5),
              const FlSpot(3, 1),
              const FlSpot(4, 2.2),
              const FlSpot(5, 2),
              const FlSpot(6, 1.5),
              const FlSpot(7, 2.8),
            ],),
          ],
        ),
      ),
    );
  }
///common chart bar for income and expense
  LineChartBarData commonChartBar({required List<FlSpot>list,Color? color}){
    return LineChartBarData(
      spots: list,
      isCurved: true,
      color:color??Colors.red,
      barWidth: 5,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        color: Colors.red.withOpacity(0.3),
      ),
    );
  }
}
