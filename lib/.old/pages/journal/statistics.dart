// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:car_journal/.old/pages/journal/show_all_expenses_view.dart';
import 'package:car_journal/.old/theme/app_theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// TODO cleanup (https://youtu.be/VPvVD8t02U8?t=59106)

class StatsView extends StatefulWidget {
  const StatsView({super.key});

  @override
  State<StatsView> createState() => _StatisitcsState();
}

class _StatisitcsState extends State<StatsView> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.themeMode().backgroundPrimary,
      appBar: AppBar(
        title: Text(
          "Статистика",
          style: TextStyle(
            color: themeProvider.themeMode().textColor,
          ),
        ),
        backgroundColor: themeProvider.themeMode().backgroundPrimary,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.18,
                  child: const _BarChart(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: themeProvider.themeMode().backgroundSecondary,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: themeProvider.themeMode().backgroundSecondary,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Траты за все время',
                                        style: TextStyle(
                                            color: themeProvider
                                                .themeMode()
                                                .additional3),
                                      ),
                                      Text(
                                        '6,424.20 ₽',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            color: themeProvider
                                                .themeMode()
                                                .textColor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 2,
                              thickness: 1,
                              color: themeProvider.themeMode().additional1,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Траты за месяц',
                                          style: TextStyle(
                                              color: themeProvider
                                                  .themeMode()
                                                  .additional3),
                                        ),
                                        Text(
                                          '424.20 ₽',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              color: themeProvider
                                                  .themeMode()
                                                  .textColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: themeProvider.themeMode().backgroundSecondary,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: themeProvider.themeMode().backgroundSecondary,
                      width: 1,
                    ),
                  ),
                  child: ListView(
                    // scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Text(
                          'Недавние расходы',
                          style: TextStyle(
                            color: themeProvider.themeMode().textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Text(
                          "3 января 2024",
                          style: TextStyle(
                              color: themeProvider.themeMode().additional3),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Заправка',
                                  style: TextStyle(
                                      color:
                                          themeProvider.themeMode().textColor),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'Роснефть',
                                      style: TextStyle(
                                          color: themeProvider
                                              .themeMode()
                                              .additional3),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              '1735 ₽',
                              style: TextStyle(
                                  color: themeProvider.themeMode().textColor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Заправка',
                                  style: TextStyle(
                                      color:
                                          themeProvider.themeMode().textColor),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'Роснефть',
                                      style: TextStyle(
                                          color: themeProvider
                                              .themeMode()
                                              .additional3),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                              child: Text(
                                '1576 ₽',
                                style: TextStyle(
                                    color: themeProvider.themeMode().textColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Text(
                        "23 декабря 2023",
                        style: TextStyle(
                            color: themeProvider.themeMode().additional3),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Заправка',
                                  style: TextStyle(
                                      color:
                                          themeProvider.themeMode().textColor),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 14,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      'Роснефть',
                                      style: TextStyle(
                                          color: themeProvider
                                              .themeMode()
                                              .additional3),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              '1000 ₽',
                              style: TextStyle(
                                  color: themeProvider.themeMode().textColor),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 2,
                        thickness: 1,
                        color: themeProvider.themeMode().additional1,
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowAllExpensesView()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Вся история расходов",
                                style: TextStyle(
                                    color: themeProvider.themeMode().textColor),
                              ),
                              Icon(
                                Icons.arrow_forward_outlined,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton.small(
      //   heroTag: "addRecordButton",
      //   foregroundColor: themeProvider.themeMode().textColor,
      //   onPressed: () {},
      //   backgroundColor: themeProvider.themeMode().accentColor,
      //   shape: const CircleBorder(),
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart();

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 18575, // max value + 25%
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 0,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Color(0xFFFAFAFA),
                fontWeight: FontWeight.w300,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Color(0xFFBBBBBB),
      fontWeight: FontWeight.w300,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Авг';
        break;
      case 1:
        text = 'Сен';
        break;
      case 2:
        text = 'Окт';
        break;
      case 3:
        text = 'Ноя';
        break;
      case 4:
        text = 'Дек';
        break;
      case 5:
        text = 'Янв';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: 4058,
              width: 40,
              borderRadius: BorderRadius.circular(5),
              color: Color(0xFF666666),
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: 4847,
              width: 40,
              borderRadius: BorderRadius.circular(5),
              color: Color(0xFF666666),
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: 6319,
              width: 40,
              borderRadius: BorderRadius.circular(5),
              color: Color(0xFF666666),
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: 7453,
              width: 40,
              borderRadius: BorderRadius.circular(5),
              color: Color(0xFF666666),
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              toY: 14860,
              width: 40,
              borderRadius: BorderRadius.circular(5),
              color: Color(0xFF666666),
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              toY: 12418,
              width: 40,
              borderRadius: BorderRadius.circular(5),
              color: Color(0xFF42B525),
            )
          ],
          showingTooltipIndicators: [0],
        ),
      ];
}
