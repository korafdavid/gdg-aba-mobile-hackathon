import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hackathon/categroy.dart';
import 'package:hackathon/model.dart';
import 'package:hackathon/text.dart';



class RandomColor {
  final Color color;
  RandomColor()
      : color = Color.fromARGB(
            randomIntF(255), randomIntF(255), randomIntF(255), randomIntF(255));
}

int randomIntF(int max) {
  final randomInt = Random();
  int value = randomInt.nextInt(max);
  if (value < 10) {
    return (value + 10);
  } else {
    return value;
  }
}

class FieldsWidgets extends StatelessWidget {
  FieldsWidgets(
      {Key? key,
      required this.fields,
      required this.randomColor0,
      required this.randomColor,
      required this.index,
      this.area = const ["Coding", "Design", "Management", "Marketing"]})
      : super(key: key);

  late Coding fields;
  final RandomColor randomColor0;
  final RandomColor randomColor;
  final int index;
  final List<String> area;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => Categroy(
                      fields: fields,
                    ))));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        height: 100,
        width: 150,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.red]),
            borderRadius: BorderRadius.circular(12)),
        child: Text(
          area[index],
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}

class WriteUp {
  String? write;

  value(String field) {
    switch (field) {
      case "web":
        write = WEB;
        break;
      case "app":
        write = appdevelopment;
        break;
      case "backend":
        write = backend;
        break;
      case "game":
        write = gamedevelopment;
        break;
      case "cybersecurity":
        write = cybersecurity;
        break;
      case "database":
        write = database;
        break;
      case "design":
        write = productDesign;
        break;
      case "ui":
        write = uiux;
        break;
      case "graphics":
        write = graphics;
        break;
      case "business":
        write = businessAnalyst;
        break;
      case "seo":
        write = seo;
        break;
      case "aso":
        write = aso;
        break;
      case "copywriting":
        write = copywriting;
        break;
      case "management":
        write = productManagement;
        break;
      case "qa":
        write = qualityAssurance;
        break;
      case "techrecruiter":
        write = techRecruiter;
        break;
      case "system":
        write = systemAdminstrator;
        break;
      default:
        write = WEB;
        break;
    }
  }
}
