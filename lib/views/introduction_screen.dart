import 'package:flutter/material.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: SafeArea(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/asset/intro.avif'),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                children: [
                  Column(
                    children: [
                      const Text(
                        'Welcome to',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                      Text(
                        'EES Services',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h / 50,
                  ),
                  const Column(
                    children: [
                      Text(
                        'our services it to help you to',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'do your work as quick as possible',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, 'HomePage');
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                width: w / 1.3,
                height: h / 100,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                    border: Border.all(color: Colors.black)),
                child: const Text('Get Started',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    )),
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
