import 'package:flutter/material.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/services.dart';

class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;
  Uri videoUrl = Uri.parse(
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.networkUrl(videoUrl)
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
                    const Text(
                      "Judul Materi Ya Ini",
                      style: TextStyle(
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
            Text("Jirlah")
          ]),
        ),
      ),
    );
  }
}
