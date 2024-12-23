import 'dart:ui';

import 'package:flutter/material.dart';

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      scrollBehavior: CustomScrollBehavior(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
            width: double.infinity,
            child: Container(
              color: Colors.yellow,
              child: const Text(
                "Toolbar",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: 320,
                  child: Container(
                    height: double.infinity,
                    color: Colors.red,
                    child: const Text("Left",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            width: double.infinity,
                            color: Colors.green,
                            child: const Text("Right - Top",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: double.infinity,
                            color: Colors.purple,
                            child: const Text("Right - Bottom",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
