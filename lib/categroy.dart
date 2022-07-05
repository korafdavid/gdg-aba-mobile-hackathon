import "package:flutter/material.dart";
import 'package:hackathon/components.dart';
import 'package:hackathon/course_page.dart';
import 'package:hackathon/model.dart';

class Categroy extends StatefulWidget {
  final Coding fields;
  const Categroy({Key? key, required this.fields}) : super(key: key);

  @override
  State<Categroy> createState() => _CategroyState();
}

class _CategroyState extends State<Categroy> {
  RandomColor randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .4,
            decoration:  BoxDecoration(
              color: randomColor.color,
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
            ),
            child: Column(children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: (() => Navigator.of(context).pop()),
                    icon: const Icon(Icons.navigate_before)),
              ),
              Text(
                widget.fields.title!,
                style: const TextStyle(
                    fontFamily: "Poppins", fontSize: 29),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.fields.details!,
                textAlign: TextAlign.center,
                    style: const TextStyle(
                        
                        fontFamily: 'Poppins', )),
              ),

            ]),
          ),
          Container(
            color: Colors.grey[200],
            margin: const EdgeInsets.only(left: 11, right: 11, top: 250),
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: widget.fields.areas!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ListTile(
                    tileColor: Colors.amber,
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => CoursePage(
                                  area: widget.fields.areas![index]))));
                    }),
                    leading: widget.fields.title == "CODING"
                        ? const Text('{}',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold))
                        : widget.fields.title == "DESIGN"
                            ? const Icon(Icons.design_services)
                            : widget.fields.title == "MANAGEMENT"
                                ? const Icon(Icons.settings)
                                : const Icon(Icons.shop),
                    title: Text(
                      widget.fields.areas![index].area!.toUpperCase(),
                      style: const TextStyle(
                          fontFamily: "Poppins", fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(widget.fields.title!.toLowerCase()),
                    trailing: const Icon(Icons.navigate_next),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    )));
  }
}
