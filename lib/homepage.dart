import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:hackathon/categroy.dart';
import 'package:hackathon/components.dart';
import 'package:hackathon/course_page.dart';
import 'package:hackathon/drawer.dart';
import 'package:hackathon/main.dart';
import 'package:hackathon/model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RandomColor randomColor0 = RandomColor();
  RandomColor randomColor1 = RandomColor();
  RandomColor randomColor2 = RandomColor();
  RandomColor randomColor3 = RandomColor();
  RandomColor drawerColor = RandomColor();
  Fields? fields;
  final _advancedDrawerController = AdvancedDrawerController();
  Future<Fields> loadJson() async {
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/data.json");
    return Fields.fromJson(jsonDecode(data));
  }


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPersistentFrameCallback((_) async {});
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      drawer: DrawerWidget(drawerColor: drawerColor),
      backdropColor: Colors.blue[100],
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                // image: DecorationImage(
                //     fit: BoxFit.fill,
                //     image: AssetImage('assets/background.png')),
                    ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: Transform(
                      transform: Matrix4.identity(),
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        color: Colors.purple,
                            onPressed: () {
                              _advancedDrawerController.showDrawer();
                            },
                            icon: const Icon(Icons.menu)),
                    ),),

                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Hello',
                        style: TextStyle(fontSize: 29),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 16, 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      box.read('name'),
                      style: const TextStyle(
                          fontFamily: "Opensans",
                          fontWeight: FontWeight.bold,
                          fontSize: 39),
                    ),
                  ),
                ),
                FutureBuilder<Fields>(
                  future: loadJson(),
                  builder: (context, AsyncSnapshot snapshot) {
                    return Wrap(children: [
                      FieldsWidgets(
                          fields: snapshot.hasData
                              ? snapshot.data!.coding
                              : Fields().coding,
                          randomColor0: randomColor0,
                          randomColor: randomColor3,
                          index: 0),
                      FieldsWidgets(
                          fields: snapshot.hasData
                              ? snapshot.data?.designs
                              : Fields().designs,
                          randomColor0: randomColor1,
                          randomColor: randomColor2,
                          index: 1),
                      FieldsWidgets(
                          fields: snapshot.hasData
                              ? snapshot.data.management
                              : Fields().management,
                          randomColor0: randomColor2,
                          randomColor: randomColor1,
                          index: 2),
                      FieldsWidgets(
                          fields: snapshot.hasData
                              ? snapshot.data.marketing
                              : Fields().marketing,
                          randomColor0: randomColor3,
                          randomColor: randomColor0,
                          index: 3),
                    ]);
                  },
                ),

                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Popular fields',
                        style: TextStyle(fontSize: 24, fontFamily: "Poppins"),
                      )),
                ),
                // const Spacer(),
                Expanded(
                  child: FutureBuilder(
                    future: loadJson(),
                    builder: (context, AsyncSnapshot snapshot) {
                      return ListView.builder(
                          shrinkWrap: true,
                          //physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.coding.areas.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => CoursePage(
                                                area: snapshot.data.coding
                                                    .areas[index]))));
                                  },
                                  child: Container(
                                    width: 200,
                                    height: 150,
                                    margin: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: randomColor0.color,
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                YoutubePlayer.getThumbnail(
                                                    videoId: YoutubePlayer
                                                        .convertUrlToId(snapshot
                                                            .data!
                                                            .coding
                                                            .areas[index]
                                                            .youtube)!))),
                                        borderRadius:
                                            BorderRadius.circular(14)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(snapshot
                                        .data.coding.areas[index].area!)),
                              ],
                            );
                          }));
                    },
                  ),
                ),
                //const Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
