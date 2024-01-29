import 'package:car_journal/pages/journal/main_view.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final _controller = PageController();
  int index = 0;
  bool isLastPage = false;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(
                () => isLastPage = index == 2,
              );
            },
            children: [
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.amber,
              ),
              Container(
                color: Colors.indigo,
              )
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green[700],
                  minimumSize: Size.fromHeight(80),
                ),
                onPressed: () async {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => MainView(),
                    ),
                  );
                },
                child: Text(
                  "Get started",
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => _controller.jumpToPage(2),
                      child: Text("SKIP"),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                          controller: _controller,
                          count: 3,
                          effect: WormEffect(spacing: 16)),
                    ),
                    TextButton(
                      onPressed: () => _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut),
                      child: Text("NEXT"),
                    )
                  ],
                ),
              ),
      );
}
