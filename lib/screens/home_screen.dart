import 'package:flutter/material.dart';
import 'package:seelearn/authentication/register_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
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
            preferredSize: const Size.fromHeight(
                60.0), // Tinggi preferensi untuk form pencarian
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
          margin: const EdgeInsets.fromLTRB(25, 15, 25, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    color: Colors.grey,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.home)),
                              const Text("Matematika")
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.home)),
                              const Text("Matematika")
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.home)),
                              const Text("Matematika")
                            ],
                          ),
                        ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
