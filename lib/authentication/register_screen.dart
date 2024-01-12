import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isEqual = false;

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              title: Text("Daftar"),
              centerTitle: false,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new_rounded))),
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
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/International_Pok%C3%A9mon_logo.svg/1200px-International_Pok%C3%A9mon_logo.svg.png")),
                        )),
                    Spacer(flex: 3),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Masukkan Email",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    buildFlexibleTextField(
                      controller: emailController,
                      hintText: 'example@email.com',
                      width: screenWidth * 0.8,
                    ),
                    Spacer(flex: 1),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Password",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    buildFlexibleTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        width: screenWidth * 0.8,
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {});
                        }),
                    Spacer(flex: 1),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Konfirmasi Password",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    buildFlexibleTextField(
                      controller: passwordConfirmationController,
                      hintText: 'Konfirmasi Password',
                      width: screenWidth * 0.8,
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          isEqual = passwordController.value == value;
                        });
                      },
                    ),
                    Text((isEqual) ? "" : "Kata sandi tidak serupa"),
                    Spacer(flex: 1),
                    FlexibleElevatedButton(
                        widget: Text("DAFTAR",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        width: screenWidth * 0.8,
                        onPressed: null),
                    Text("Atau daftar dengan"),
                    FlexibleElevatedButton(
                        widget: Row(children: [
                          Spacer(flex: 10),
                          FaIcon(FontAwesomeIcons.google),
                          Spacer(flex: 1),
                          Text("Google"),
                          Spacer(flex: 10),
                        ]),
                        width: screenWidth * 0.8,
                        onPressed: null),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Sudah punya akun?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                          child: Text("Masuk",
                              style: TextStyle(fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                    Spacer(flex: 2),
                  ],
                ),
              ))),
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
        ));
  }

  Widget buildFlexibleTextField({
    required TextEditingController controller,
    required double width,
    bool obscureText = false,
    required String hintText,
    void Function(String)? onChanged = null,
  }) {
    return Flexible(
      flex: 3,
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        obscureText: obscureText,
      ),
    );
  }
}
