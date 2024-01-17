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
              SizedBox(
                height: 12,
              ),
              Container(
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
                            builder: (context) => MaterialVideoScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'lib/assets/images/google_logo.png'),
                                fit: BoxFit.fill,
                              ),
                              shape: OvalBorder(),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          const Text(
                            "Judul Materi Ya Ini",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                color: Colors.black),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.bookmark_add_rounded)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.download)),
                        ]),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
