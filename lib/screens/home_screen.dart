import 'package:flutter/material.dart';
import 'package:seelearn/authentication/register_screen.dart';

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
                            builder: (context) => const RegisterScreen()));
                  },
                  child: const Text(
                    "Daftar/Masuk",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
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
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.white.withOpacity(0.800000011920929),
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Kategori"),
                          DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(
                              Icons.expand_more_rounded,
                              size: 16,
                            ),
                            elevation: 16,
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
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.home)),
                        const Text("Matematika")
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.home)),
                        const Text("Matematika")
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.home)),
                        const Text("Matematika")
                      ],
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
