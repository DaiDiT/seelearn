import 'package:flutter/material.dart';
import 'package:seelearn/authentication/login_screen.dart';
import 'subject_detail_screen.dart';

const List<String> list = <String>[
  'Kelas 1',
  'Kelas 2',
  'Kelas 3',
  'Kelas 4',
  'Kelas 5',
  'Kelas 6'
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFD700),
          actions: [
            Padding(
                padding: const EdgeInsets.only(top: 30, right: 25),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Masuk",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.login,
                          color: Colors.black,
                          size: 16,
                        )
                      ]),
                )),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: TextFormField(
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: 'Mau belajar apa hari ini?',
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 8, left: 8),
                    child: IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.search_rounded,
                          color: Colors.black,
                          size: 24,
                        )),
                  ),
                ),
                style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        body: Container(
          color: const Color(0xFFE9E9E9),
          child: ListView(
            children: [
              const Padding(
                  padding: EdgeInsets.only(left: 35, top: 16),
                  child: Text(
                    "Selamat Datang!",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              Container(
                height: 128,
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                padding: const EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF4E88CA), Color(0x004E88CA)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 165,
                        child: Text(
                            "Belajar Tanpa Batas, Meraih Impian dengan Pendidikan Berkualitas",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                color: Colors.black)),
                      ),
                      Image(
                          width: 80,
                          height: 128,
                          image: AssetImage('lib/assets/images/welcome.png'))
                    ]),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.only(right: 18, left: 18, bottom: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Kategori",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 12,
                                color: Colors.black)),
                        DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(
                            Icons.expand_more_rounded,
                            size: 16,
                          ),
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          items: list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }).toList(),
                        )
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildSubjectButton(
                          name: "Matematika", asset: "mathematics"),
                      buildSubjectButton(name: "IPA", asset: "natural_science"),
                      buildSubjectButton(
                          name: "Bahasa Indonesia",
                          asset: "indonesian_language"),
                      buildSubjectButton(name: "IPS", asset: "social_science"),
                    ],
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSubjectButton({
    required String name,
    required String asset,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    SubjectDetailScreen(subject: name, grade: dropdownValue)));
      },
      child: SizedBox(
        width: 64,
        height: 92,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Image(
                height: 50,
                width: 50,
                image: AssetImage('lib/assets/images/subjects/$asset.png'),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: 'Roboto', fontSize: 12, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
