import 'package:flutter/material.dart';
import 'package:hackathon/components.dart';
import 'package:hackathon/model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CoursePage extends StatefulWidget {
  final Areas area;
  const CoursePage({Key? key, required this.area}) : super(key: key);

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
  
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.area.youtube!)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );

  //    void listener() {
  //   if (_isPlayerReady && mounted && !controller.value.isFullScreen) {
  //     setState(() {
  //       _playerState = controller.value.playerState;
  //       _videoMetaData = controller.metadata;
  //     });
  //   }
  // }


    WriteUp writeUp = WriteUp();
    writeUp.value(widget.area.text!);
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        backgroundColor: Colors.transparent,
        toolbarOpacity: 1,
        shadowColor: Colors.transparent,
        leading: IconButton(
            onPressed: (() => Navigator.of(context).pop()),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: ListView(
        children: [
         YoutubePlayer(
    controller: controller,
    showVideoProgressIndicator: true,
    progressIndicatorColor: Colors.amber,
    progressColors: const ProgressBarColors(
        playedColor: Colors.amber,
        handleColor: Colors.amberAccent,
    ),
    onReady: () {
        //controller.addListener(listener);
    },
),

     
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.area.area!,
                  style: const TextStyle(color: Colors.purple, fontSize: 23),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              writeUp.write!,
              style: const TextStyle(color: Colors.grey, fontFamily: "Poppins"),
            ),
          ),
        ],
      ),
    );
  }
}
