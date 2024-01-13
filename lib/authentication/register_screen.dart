import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();
  final TextEditingController schoolOriginController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  bool isVisible = false;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Daftar"),
          titleSpacing: 0,
          titleTextStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          centerTitle: false,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Image(
                    height: 128,
                    width: 128,
                    image: AssetImage('lib/assets/images/seelearn_logo.png'),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nama",
                      style: TextStyle(fontWeight: FontWeight.bold, height: 3),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(.4),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Masukkan nama anda";
                        }
                        return null;
                      },
                      controller: nameController,
                      maxLines: 1,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Masukkan Nama",
                          contentPadding: EdgeInsets.symmetric(horizontal: 15)),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Kelas",
                      style: TextStyle(fontWeight: FontWeight.bold, height: 3),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(.4),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Masukkan kelas anda";
                        }
                        return null;
                      },
                      controller: gradeController,
                      maxLines: 1,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Masukkan Kelas",
                          contentPadding: EdgeInsets.symmetric(horizontal: 15)),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sekolah",
                      style: TextStyle(fontWeight: FontWeight.bold, height: 3),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(.4),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Masukkan sekolah anda";
                        }
                        return null;
                      },
                      controller: schoolOriginController,
                      maxLines: 1,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Masukkan Sekolah",
                          contentPadding: EdgeInsets.symmetric(horizontal: 15)),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email",
                      style: TextStyle(fontWeight: FontWeight.bold, height: 3),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(.4),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Masukkan email anda";
                        }
                        return null;
                      },
                      controller: emailController,
                      maxLines: 1,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Masukkan Email",
                          contentPadding: EdgeInsets.symmetric(horizontal: 15)),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Kata Sandi",
                      style: TextStyle(fontWeight: FontWeight.bold, height: 3),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(.4),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Masukkan kata sandi anda";
                        }
                        return null;
                      },
                      controller: passwordController,
                      maxLines: 1,
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Masukkan Kata Sandi",
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        suffixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                icon: Icon((!isVisible)
                                    ? Icons.visibility_off
                                    : Icons.visibility))),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Konfirmasi Kata Sandi",
                      style: TextStyle(fontWeight: FontWeight.bold, height: 3),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(.4),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value! != passwordController.value) {
                          return "Kata sandi tidak sama";
                        }
                        return null;
                      },
                      maxLines: 1,
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Masukkan Ulang Kata Sandi",
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        suffixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                icon: Icon((!isVisible)
                                    ? Icons.visibility_off
                                    : Icons.visibility))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.yellow,
                    ),
                    child: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        child: const Text(
                          "DAFTAR",
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Atau daftar dengan",
                      style: TextStyle(height: 3),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(FontAwesomeIcons.google),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Google",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Sudah punya akun?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        child: const Text("Masuk",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, height: 3)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
