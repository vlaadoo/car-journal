// ignore_for_file: prefer_const_constructors, unused_import

import 'package:car_journal/constants/routes.dart';
import 'package:car_journal/pages/journal/edit_password.dart';
import 'package:car_journal/services/auth/auth_service.dart';
import 'package:car_journal/services/database/sql_connector.dart';
import 'package:car_journal/theme/app_theme.dart';
import 'package:car_journal/widgets/logout_dialog_widget.dart';
// import 'package:car_journal/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as devtools show log;

// TODO cleanup (https://youtu.be/VPvVD8t02U8?t=59106)

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountState();
}

class _AccountState extends State<AccountView> {
  late Future<List<Map>> _allNames;
  final _mysql = SQLConnector();
  String get userId => AuthService.firebase().currentUser!.id;

  Future<List<Map>> getName() async {
    return await _mysql.getNameAndSurname(userId);
  }

  @override
  void initState() {
    super.initState();
    _allNames = getName();
  }

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.mode_night);
      }
      return const Icon(Icons.light_mode);
    },
  );

  final MaterialStateProperty<Color?> trackColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      // Track color when the switch is selected.
      if (states.contains(MaterialState.selected)) {
        return const Color(0xFF759655);
      }
      // Otherwise return null to set default track color
      // for remaining states such as when the switch is
      // hovered, focused, or disabled.
      return null;
    },
  );
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    // List<Map> myNames = [
    //   {
    //     'name': 'Vladislav',
    //     'surname': 'Борисенков',
    //     'email': 'vlad.borisenkov@gmail.com'
    //   }
    // ];

    // final _name = myNames.first['name'],
    //     _surname = myNames.first['surname'],
    //     _email = myNames.first['email'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Профиль",
          style: TextStyle(
            color: themeProvider.themeMode().textColor,
          ),
        ),
        backgroundColor: themeProvider.themeMode().backgroundPrimary,
      ),
      body: FutureBuilder(
        future: _allNames,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('none');
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
              return Text('active');
            case ConnectionState.done:
              if (snapshot.hasError) {
                return SafeArea(
                    child: Center(
                        child: Text(
                  "Проверьте соединение с интернетом",
                  style: TextStyle(color: Color(0xFFFFC200)),
                )));
              } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                return Text("empty");
              } else {
                final _name = snapshot.data!.first['name'],
                    _surname = snapshot.data!.first['surname'],
                    _email = snapshot.data!.first['email'];
                return SafeArea(
                  child: Container(
                    color: themeProvider.themeMode().backgroundPrimary,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 24, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '$_name $_surname',
                                          style: TextStyle(
                                            color: themeProvider
                                                .themeMode()
                                                .textColor,
                                            fontSize: 24,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 0),
                                          child: Text(
                                            _email,
                                            style: TextStyle(
                                              color: themeProvider
                                                  .themeMode()
                                                  .additional1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 12, 0, 12),
                              child: Text(
                                'Настройки',
                                style: TextStyle(
                                  color: themeProvider.themeMode().additional2,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Темная тема"),
                              SizedBox(
                                width: 80,
                                height: 40,
                                child: Switch(
                                  activeColor: themeProvider
                                      .themeMode()
                                      .backgroundPrimary,
                                  trackColor: trackColor,
                                  thumbIcon: thumbIcon,
                                  onChanged: (value) =>
                                      themeProvider.toggleThemeData(),
                                  value: !themeProvider.isLightMode,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditPasswordView()));
                          },
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                color: themeProvider
                                    .themeMode()
                                    .backgroundSecondary,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: Color(0x3416202A),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Text(
                                        'Изменить пароль',
                                        style: TextStyle(
                                            color: themeProvider
                                                .themeMode()
                                                .additional2),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: AlignmentDirectional(0.9, 0),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color(0xFF57636C),
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor:
                                themeProvider.themeMode().backgroundSecondary,
                          ),
                          onPressed: () {
                            showLogOutDialod(context, themeProvider);
                          },
                          child: Text(
                            "Выйти",
                            style: TextStyle(
                              color: themeProvider.themeMode().textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
