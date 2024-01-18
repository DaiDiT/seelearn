import 'package:flutter/material.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/services.dart';

class MaterialVideoScreen extends StatefulWidget {
  final String videoTitle, videoSource;
  const MaterialVideoScreen(
      {Key? key, required this.videoTitle, required this.videoSource})
      : super(key: key);

  @override
  State<MaterialVideoScreen> createState() => _MaterialVideoScreenState();
}

class _MaterialVideoScreenState extends State<MaterialVideoScreen> {
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoSource))
          ..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
        context: context,
        videoPlayerController: videoPlayerController,
        customVideoPlayerSettings: const CustomVideoPlayerSettings(
          autoFadeOutControls: true,
          durationAfterControlsFadeOut: Duration(seconds: 2),
          deviceOrientationsAfterFullscreen: [
            DeviceOrientation.landscapeRight,
            DeviceOrientation.landscapeLeft
          ],
          playButton: Icon(
            Icons.play_circle,
            color: Colors.white,
          ),
          pauseButton: Icon(
            Icons.pause_circle,
            color: Colors.white,
          ),
          showFullscreenButton: true,
          enterFullscreenButton: Icon(
            Icons.fullscreen_rounded,
            color: Colors.white,
          ),
          exitFullscreenButton: Icon(
            Icons.fullscreen_exit_rounded,
            color: Colors.white,
          ),
          settingsButtonAvailable: false,
        ));
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_rounded),
            color: Colors.black),
        backgroundColor: const Color(0xFFFFD700),
      ),
      body: Container(
        color: const Color(0xFFE9E9E9),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 24),
              padding: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.videoTitle,
                      style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          color: Colors.black),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.tune)),
                  ]),
            ),
            CustomVideoPlayer(
              customVideoPlayerController: _customVideoPlayerController,
            ),
          ]),
        ),
      ),
    );
  }
}
