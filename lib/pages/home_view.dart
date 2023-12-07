import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeView> {
  int indexColor = 0;
  List screen = [
    const Text("Home"),
    const Text("Stats"),
    const Text("wallet"),
    const Text("account"),
  ];
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FilledButton(
              onPressed: _decrementCounter,
              child: const Text('Enabled'),
            ),
            const SizedBox(height: 30),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        onPressed: _incrementCounter,
        backgroundColor: const Color(0xff368983),
        tooltip: 'Increment',
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          height: 60,
          shape: const CircularNotchedRectangle(),
          child: Padding(
            padding: const EdgeInsets.only(top: 3, bottom: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      indexColor = 0;
                    });
                  },
                  child: Icon(
                    Icons.home,
                    size: 30,
                    color:
                        indexColor == 0 ? const Color(0xff368983) : Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      indexColor = 1;
                    });
                  },
                  child: Icon(
                    Icons.bar_chart_outlined,
                    size: 30,
                    color:
                        indexColor == 1 ? const Color(0xff368983) : Colors.grey,
                  ),
                ),
                const SizedBox(width: 30),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      indexColor = 2;
                    });
                  },
                  child: Icon(
                    Icons.account_balance_wallet_outlined,
                    size: 30,
                    color:
                        indexColor == 2 ? const Color(0xff368983) : Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      indexColor = 3;
                    });
                  },
                  child: Icon(
                    Icons.person_outlined,
                    size: 30,
                    color:
                        indexColor == 3 ? const Color(0xff368983) : Colors.grey,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
