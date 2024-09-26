import 'package:car_journal/.old/pages/journal/account.dart';
import 'package:car_journal/.old/pages/journal/dashboard.dart';
import 'package:car_journal/.old/pages/journal/garage.dart';
import 'package:car_journal/.old/pages/journal/statistics.dart';
import 'package:car_journal/.old/theme/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// TODO cleanup (https://youtu.be/VPvVD8t02U8?t=59106)

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int pageIndex = 0;
  List<Widget> pages = [
    const DashboardView(),
    const StatsView(),
    const GarageView(),
    const AccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.themeMode().backgroundPrimary,
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: themeProvider.themeMode().backgroundSecondary,
          indicatorColor: themeProvider.themeMode().accentColor,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          indicatorShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
          height: 60,
        ),
        child: NavigationBar(
          animationDuration: const Duration(milliseconds: 500),
          selectedIndex: pageIndex,
          onDestinationSelected: (pageIndex) =>
              setState(() => this.pageIndex = pageIndex),
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.home,
                color: themeProvider.themeMode().additional1,
              ),
              label: "Главная",
              selectedIcon: Icon(
                Icons.home,
                color: themeProvider.themeMode().textColor,
              ),
            ),
            NavigationDestination(
              icon: Icon(
                Icons.bar_chart_outlined,
                color: themeProvider.themeMode().additional1,
              ),
              label: "Статистика",
              selectedIcon: Icon(
                Icons.bar_chart_outlined,
                color: themeProvider.themeMode().textColor,
              ),
            ),
            NavigationDestination(
              icon: Icon(
                Icons.directions_car_rounded,
                color: themeProvider.themeMode().additional1,
              ),
              label: "Гараж",
              selectedIcon: Icon(
                Icons.directions_car_rounded,
                color: themeProvider.themeMode().textColor,
              ),
            ),
            NavigationDestination(
              icon: Icon(
                Icons.person,
                color: themeProvider.themeMode().additional1,
              ),
              selectedIcon: Icon(
                Icons.person,
                color: themeProvider.themeMode().textColor,
              ),
              label: "Профиль",
            ),
          ],
        ),
      ),
    );
  }
}
