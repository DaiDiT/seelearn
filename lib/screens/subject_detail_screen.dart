import 'package:flutter/material.dart';
import 'material_video_screen.dart';

class SubjectDetailScreen extends StatefulWidget {
  final String subject, grade;

  const SubjectDetailScreen(
      {Key? key, required this.subject, required this.grade})
      : super(key: key);

  @override
  State<SubjectDetailScreen> createState() => _SubjectDetailScreenState();
}

class _SubjectDetailScreenState extends State<SubjectDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.subject,
                style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
            Text(
              "${widget.grade} - SD",
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  color: Colors.black.withOpacity(0.5)),
            )
          ],
        ),
        titleSpacing: 0,
        centerTitle: false,
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
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            children: [
              buildMaterialVideoButton(
                  iconAsset: "1",
                  materialName: "Bilangan 1 sampai 10",
                  videoAsset:
                      "https://peopconn.000webhostapp.com/video_contoh.mp4"),
              buildMaterialVideoButton(
                  iconAsset: "2",
                  materialName: "Menyusun Bilangan",
                  videoAsset:
                      "https://peopconn.000webhostapp.com/video_contoh.mp4"),
              buildMaterialVideoButton(
                  iconAsset: "3",
                  materialName: "Penjumlahan",
                  videoAsset:
                      "https://peopconn.000webhostapp.com/video_contoh.mp4"),
              buildMaterialVideoButton(
                  iconAsset: "4",
                  materialName: "Bangun Datar",
                  videoAsset:
                      "https://peopconn.000webhostapp.com/video_contoh.mp4"),
              buildMaterialVideoButton(
                  iconAsset: "5",
                  materialName: "Bilangan lebih dari 10",
                  videoAsset:
                      "https://peopconn.000webhostapp.com/video_contoh.mp4"),
              buildMaterialVideoButton(
                  iconAsset: "6",
                  materialName: "Pengurangan",
                  videoAsset:
                      "https://peopconn.000webhostapp.com/video_contoh.mp4"),
            ]),
      ),
    );
  }

  Widget buildMaterialVideoButton({
    required String iconAsset,
    required String materialName,
    required String videoAsset,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MaterialVideoScreen(
                      videoTitle: materialName, videoSource: videoAsset)));
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              width: 40,
              height: 40,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/icons/$iconAsset.png'),
                  fit: BoxFit.fill,
                ),
                shape: const OvalBorder(),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              materialName,
              style: const TextStyle(
                  fontSize: 12, fontFamily: 'Roboto', color: Colors.black),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark_add_rounded,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.download_for_offline_outlined,
                  color: Colors.black,
                )),
          ]),
        ),
      ),
    );
  }
}
