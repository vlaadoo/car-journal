import 'package:car_journal/.old/pages/journal/show_all_expenses_view.dart';
import 'package:car_journal/.old/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;

// TODO cleanup (https://youtu.be/VPvVD8t02U8?t=59106)

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardView> {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  late String range;
  late String lastOper;
  List<String> ranges = ['154354', '435614', '234156'];
  List<String> lastOperations = [
    'Заправка\n1929 ₽',
    'ТО\n8000 ₽',
    'Мойка\n600 ₽'
  ];

  @override
  void initState() {
    range = ranges[0];
    lastOper = lastOperations[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.themeMode().backgroundPrimary,
      appBar: AppBar(
        title: Text(
          "Главная",
          style: TextStyle(
            color: themeProvider.themeMode().textColor,
          ),
        ),
        backgroundColor: themeProvider.themeMode().backgroundPrimary,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.33,
                child: SizedBox(
                  width: double.infinity,
                  height: 500,
                  child: Stack(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                        child: PageView(
                          onPageChanged: (index) {
                            setState(() {
                              range = ranges[index];
                              lastOper = lastOperations[index];
                            });
                          },
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://img.freepik.com/free-photo/long-shot-shepherd-walking-field_23-2149744253.jpg?w=1380&t=st=1703367510~exp=1703368110~hmac=7b20381735636ceb4b49e528b2a046fc98e053c5ec92644143785da172cac0d9',
                                width: MediaQuery.sizeOf(context).width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://img.freepik.com/free-photo/beautiful-retro-nature-with-flowers_23-2149681494.jpg?w=1380&t=st=1703367540~exp=1703368140~hmac=80d535fbfe50105d3c51731123aec355247513b31eb651d466a7a0f82e3550f9',
                                width: MediaQuery.sizeOf(context).width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://img.freepik.com/free-photo/bald-eagle-perched-majestically-tree-branch-generative-ai_188544-8795.jpg?w=1060&t=st=1703368668~exp=1703369268~hmac=248f79227807898b8acfdaded6336fff12ddb79e8aeb7675ca33f997d688c712',
                                width: MediaQuery.sizeOf(context).width,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 1),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16, 0, 0, 16),
                          child: smooth_page_indicator.SmoothPageIndicator(
                            controller: controller,
                            count: 3,
                            axisDirection: Axis.horizontal,
                            effect: smooth_page_indicator.ExpandingDotsEffect(
                              expansionFactor: 3,
                              spacing: 8,
                              radius: 16,
                              dotWidth: 8,
                              dotHeight: 8,
                              dotColor:
                                  themeProvider.themeMode().backgroundTertiary,
                              activeDotColor:
                                  themeProvider.themeMode().accentColor,
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShowAllExpensesView(),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.46,
                      height: MediaQuery.sizeOf(context).height * 0.225,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: themeProvider.themeMode().backgroundSecondary,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Последняя трата",
                              style: TextStyle(
                                fontSize: 16,
                                color: themeProvider.themeMode().textColor,
                              ),
                            ),
                            Text(lastOper),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.46,
                    height: MediaQuery.sizeOf(context).height * 0.225,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: themeProvider.themeMode().backgroundSecondary,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "След. ТО",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: themeProvider.themeMode().textColor,
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: themeProvider.themeMode().textColor,
                                  size: 16,
                                ),
                              ],
                            ),
                            Text(range)
                          ]),
                      // child: Text.rich(
                      //   TextSpan(
                      //     style: TextStyle(
                      //       fontSize: 16,
                      //       color: themeProvider.themeMode().textColor,
                      //     ),
                      //     children: [
                      //       const TextSpan(
                      //         text: 'След. ТО',
                      //       ),
                      //       WidgetSpan(
                      //         child: Icon(
                      //           Icons.chevron_right,
                      //           color: themeProvider.themeMode().textColor,
                      //           size: 16,
                      //         ),
                      //       ),
                      //       TextSpan(text: range),
                      //     ],
                      //   ),
                      // ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
