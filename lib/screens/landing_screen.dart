import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'login_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Spacer(flex: 8),
              Flexible(
                  flex: 12,
                  child: SizedBox(
                    child: Image(
                        image: NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Pok%C3%A9_Ball_icon.svg/800px-Pok%C3%A9_Ball_icon.svg.png")),
                  )),
              Spacer(flex: 8),
              FlexibleElevatedButton(
                  text: "Daftar Sekarang",
                  width: screenWidth * 0.8,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  }),
              Spacer(flex: 1),
              FlexibleElevatedButton(
                  text: "Masuk",
                  width: screenWidth * 0.8,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  }),
              Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget FlexibleElevatedButton({
    required String text,
    required double width,
    required VoidCallback? onPressed,
  }) {
    return Flexible(
        flex: 3,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: Container(
            width: width,
            child: Center(child: Text(text)),
          ),
          onPressed: onPressed,
        ));
  }
}
