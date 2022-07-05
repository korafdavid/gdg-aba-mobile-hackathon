import 'package:flutter/material.dart';
import 'package:hackathon/responsive.dart';
import 'package:hackathon/welcome_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveWidget(
            largeScreen: largeScreen(),
            mediumScreen: mediumScreen(),
            smallScreen: smallScreen(context)),
      ),
    );
  }
}

Widget largeScreen() {
  return Container();
}

Widget mediumScreen() {
  return Row(
    children: [
      Flexible(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 90, left: 10),
                child: Image.asset('assets/gdg.png', height: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 150, left: 10),
              child: Wrap(
                children: const [
                  Text(
                    'Creative and directive way to guide Tech Newbies right into the world of tech',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 36,
                        fontFamily: "Opensans",
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Changing and illuminating your tech perspectives would certainly act as a boost to your tech Career',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: "Opensans"),
                ),
              ),
            ),
          ],
        ),
      ),
      Flexible(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 30, right: 10),
              child: Align(
                alignment: Alignment.topRight,
                child: MaterialButton(
                  height: 50,
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white,
                  child: const Text(
                    'Get Started',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Image.asset('assets/future.gif', height: 350),
          ],
        ),
      )
    ],
  );
}

Widget smallScreen(BuildContext context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Image.asset('assets/gdg.png', height: 20),
      ),
      const Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Creative and directive way to guide Tech Newbies right into the world of tech',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 26,
              fontFamily: "Opensans",
              fontWeight: FontWeight.bold),
        ),
      ),
      Image.asset('assets/future.gif', height: 350),
      const Spacer(),
      const Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Changing and illuminating your tech perspectives would certainly act as a boost to your tech Career',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, fontFamily: "Opensans"),
        ),
      ),
      MaterialButton(
        height: 50,
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => Welcome())));
        },
        color: Colors.red,
        textColor: Colors.white,
        child: const Text(
          'Get Started',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        minWidth: MediaQuery.of(context).size.width * .9,
      ),
      const Spacer()
    ],
  );
}
