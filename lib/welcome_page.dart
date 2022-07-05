import 'package:flutter/material.dart';
import 'package:hackathon/components.dart';
import 'package:hackathon/homepage.dart';
import 'package:hackathon/main.dart';
import 'package:hackathon/responsive.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  RandomColor randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 90, left: 10),
                child: Image.asset('assets/gdg.png', height: 20),
              ),
            ),
            Align(
              alignment: ResponsiveWidget.isSmallScreen(context)
                  ? Alignment.topLeft
                  : Alignment.center,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Enter your name',
                  style: TextStyle(
                      fontFamily: "Opensans",
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: ResponsiveWidget.isSmallScreen(context)
                  ? const EdgeInsets.all(8.0)
                  : const EdgeInsets.only(
                      top: 16, bottom: 16, left: 100, right: 100),
              child: Form(
                key: formkey,
                child: TextFormField(
                  controller: nameController,
                  validator: (string) {
                    if (string!.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    if (value != null) {
                      box.write('name', nameController.text);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: randomColor.color,
                    filled: true,
                    hintText: "e.g   David",
                    hintStyle: const TextStyle(color: Colors.grey),
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFD0E2DC)),
                        borderRadius: BorderRadius.circular(15)),
                        focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFD0E2DC)),
                        borderRadius: BorderRadius.circular(15)),
                    errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFD0E2DC)),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFD0E2DC)),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          box.write('name', nameController.text);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        }
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text(
                        'Next',
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 7,
                          primary: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
