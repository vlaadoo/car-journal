// ignore_for_file: must_be_immutable

import 'package:car_journal/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ShowAllExpensesView extends StatefulWidget {
  const ShowAllExpensesView({super.key});
  @override
  State<ShowAllExpensesView> createState() => _ShowAllExpensesViewState();
}

class _ShowAllExpensesViewState extends State<ShowAllExpensesView> {
  List _elements = [
    {'name': 'Заправка\t1929 ₽', 'date': DateTime(2023, 11, 19)},
    {'name': 'Мойка\t600 ₽', 'date': DateTime(2023, 11, 20)},
    {'name': 'ТО\t6500 ₽', 'date': DateTime(2023, 9, 1)},
    {'name': 'Заправка\t1929 ₽', 'date': DateTime(2023, 19, 11)},
    {'name': 'Заправка\t1929 ₽', 'date': DateTime(2024, 01, 01)},
    {'name': 'Заправка\t1929 ₽', 'date': DateTime(2023, 12, 28)},
    {'name': 'Заправка\t1929 ₽', 'date': DateTime(2024, 01, 19)},
    {'name': 'Заправка\t1929 ₽', 'date': DateTime(2024, 01, 13)},
    {'name': 'Заправка\t1929 ₽', 'date': DateTime(2024, 01, 13)},
    {'name': 'Заправка\t1929 ₽', 'date': DateTime(2024, 02, 19)},
    {'name': 'Заправка\t1929 ₽', 'date': DateTime(2024, 01, 13)},
    {'name': 'Заправка\t1929 ₽', 'date': DateTime(2024, 01, 01)},
    {'name': 'Заправка\t1929 ₽', 'date': DateTime(2024, 01, 01)},
    {'name': 'Заправка\t1929 ₽', 'date': DateTime(2024, 01, 11)},
    {'name': 'Заправка\t1929 ₽', 'date': DateTime(2024, 01, 10)},
    {'name': 'Заправка\t1929 ₽', 'date': DateTime(2023, 12, 28)},
    {'name': 'Заправка\t1929 ₽', 'date': DateTime(2023, 12, 27)},
  ];

  @override
  Widget build(BuildContext context) {
    // Intl.defaultLocale = "ru";
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("История расходов"),
      ),
      backgroundColor: themeProvider.themeMode().backgroundPrimary,
      body: SafeArea(
        child: GroupedListView<dynamic, DateTime>(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          elements: _elements,
          groupBy: (element) => element['date'],
          // groupBy: (element) =>
          //     DateFormat('dd MMM yyyy').format(element['date']),
          groupComparator: (value1, value2) => value2.compareTo(value1),
          itemComparator: (item1, item2) =>
              item1['name'].compareTo(item2['name']),
          order: GroupedListOrder.ASC,
          groupSeparatorBuilder: (DateTime value) => SizedBox(
            width: double.infinity,
            child: Text(
              DateFormat('dd MMM yyyy, E').format(value),
              style: TextStyle(color: themeProvider.themeMode().additional3),
            ),
          ),
          itemBuilder: (c, element) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              child: Text(
                element['name'],
                style: TextStyle(fontSize: 16),
              ),
            );
          },
        ),
      ),
      // body: SafeArea(
      //   child: SingleChildScrollView(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       mainAxisSize: MainAxisSize.max,
      //       children: [
      //         const SizedBox(height: 10),
      //         GroupedListView<dynamic, String>(
      //           elements: _elements,
      //           groupBy: (element) => element['group'],
      //           groupSeparatorBuilder: (String groupByValue) =>
      //               Text(groupByValue),
      //           itemBuilder: (context, dynamic element) =>
      //               Text(element['name']),
      //           itemComparator: (item1, item2) =>
      //               item1['name'].compareTo(item2['name']), // optional
      //           useStickyGroupSeparators: true, // optional
      //           floatingHeader: true, // optional
      //           order: GroupedListOrder.ASC, // optional
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
