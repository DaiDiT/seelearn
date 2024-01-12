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
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                height: 64,
                width: 64,
                image: AssetImage('lib/assets/images/seelearn_logo.jpg'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                },
                child: Text(
                  "Daftar/Masuk",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
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
                          IconButton(onPressed: () {}, icon: Icon(Icons.home)),
                          Text("Matematika")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.home)),
                          Text("Matematika")
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.home)),
                          Text("Matematika")
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
