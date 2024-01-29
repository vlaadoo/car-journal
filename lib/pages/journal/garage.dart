// ignore_for_file: unused_local_variable

import 'package:car_journal/pages/journal/add_edit_car_view.dart';
import 'package:car_journal/services/auth/auth_service.dart';
import 'package:car_journal/services/database/sql_connector.dart';
import 'package:car_journal/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// TODO cleanup (https://youtu.be/VPvVD8t02U8?t=59106)

class GarageView extends StatefulWidget {
  const GarageView({super.key});

  @override
  State<GarageView> createState() => _GarageState();
}

class _GarageState extends State<GarageView> {
  late Future<List<Map>> _allCars;
  final _mysql = SQLConnector();
  String get userId => AuthService.firebase().currentUser!.id;

  Future<List<Map>> getCars() async {
    return await _mysql.getCars(userId);
  }

  @override
  void initState() {
    super.initState();
    _allCars = getCars();
  }

  void updateGarageState() {
    setState(() {
      _allCars = getCars();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeMode().backgroundPrimary,
      appBar: AppBar(
        title: Text(
          "Ваши автомобили",
          style: TextStyle(
            color: themeProvider.themeMode().textColor,
          ),
        ),
        backgroundColor: themeProvider.themeMode().backgroundPrimary,
      ),
      body: FutureBuilder(
        future: _allCars,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('none');
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
              return const Text('active');
            case ConnectionState.done:
              if (snapshot.hasError) {
                return const SafeArea(
                  child: Center(
                    child: Text(
                      "Проверьте соединение с интернетом",
                      style: TextStyle(color: Color(0xFFFFC200)),
                    ),
                  ),
                );
              } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                return const Text("empty");
              } else {
                return SafeArea(
                  child: RefreshIndicator(
                    backgroundColor:
                        themeProvider.themeMode().backgroundTertiary,
                    color: themeProvider.themeMode().accentColor,
                    displacement: 20,
                    triggerMode: RefreshIndicatorTriggerMode.onEdge,
                    onRefresh: () async {
                      setState(() {
                        _allCars = getCars();
                      });
                    },
                    child: ListView.separated(
                      itemCount: snapshot.data!.length,
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 8),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddEditCarView(
                                  userId: userId,
                                  car: snapshot.data![index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  themeProvider.themeMode().backgroundSecondary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 5),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: snapshot.data![index]
                                                ['car title'],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 10),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.3,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: themeProvider
                                            .themeMode()
                                            .backgroundTertiary,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: themeProvider
                                              .themeMode()
                                              .backgroundTertiary,
                                          width: 2,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(7, 0, 7, 0),
                                          child: Text(
                                            snapshot.data![index]['car number'],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        heroTag: "addCarTag",
        foregroundColor: themeProvider.themeMode().textColor,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddEditCarView(
                        userId: userId,
                      )));
        },
        backgroundColor: themeProvider.themeMode().accentColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
