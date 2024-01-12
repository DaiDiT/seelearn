import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'package:seelearn/navigation_menu.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Masuk"),
          centerTitle: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Spacer(flex: 1),
                Flexible(
                  flex: 6,
                  child: SizedBox(
                    width: screenWidth * 0.8,
                    child: Image(
                      image: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/International_Pok%C3%A9mon_logo.svg/1200px-International_Pok%C3%A9mon_logo.svg.png"),
                    ),
                  ),
                ),
                Spacer(flex: 3),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Masukkan Email",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                FlexibleTextFormField(
                  controller: emailController,
                  labelText: 'example@email.com',
                  width: screenWidth * 0.8,
                ),
                Spacer(flex: 1),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Kata sandi",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                FlexibleTextFormField(
                  controller: passwordController,
                  labelText: 'Kata sandi',
                  width: screenWidth * 0.8,
                  obscureText: true,
                ),
                Spacer(flex: 1),
                GestureDetector(
                  onTap: null,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text("Lupa kata sandi?"),
                  ),
                ),
                Spacer(flex: 1),
                FlexibleElevatedButton(
                  widget: Text("MASUK",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  width: screenWidth * 0.8,
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NavigationMenu()));
                  },
                ),
                Text("Atau daftar dengan"),
                FlexibleElevatedButton(
                  widget: Row(
                    children: [
                      Spacer(flex: 10),
                      FaIcon(FontAwesomeIcons.google),
                      Spacer(flex: 1),
                      Text("Google"),
                      Spacer(flex: 10),
                    ],
                  ),
                  width: screenWidth * 0.8,
                  onPressed: null,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Belum punya akun?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()),
                        );
                      },
                      child: Text("Daftar sekarang",
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
                Spacer(flex: 6),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget FlexibleElevatedButton({
    required Widget widget,
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
          child: Center(child: widget),
        ),
        onPressed: onPressed,
      ),
    );
  }

  Widget FlexibleTextFormField({
    required TextEditingController controller,
    required double width,
    bool obscureText = false,
    required String labelText,
  }) {
    return Flexible(
      flex: 3,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
        ),
        obscureText: obscureText,
      ),
    );
  }
}
