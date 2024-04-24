import 'package:betting_tips/pages/auth/login.dart';
import 'package:betting_tips/pages/nav/navPage.dart';
import 'package:betting_tips/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/colors.dart';
import '../../widgets/textinput.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool showPassword = true;

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: myBlack,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Text(
              'Register',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.025),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              'Create account to join the winnig teams',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: size.height * 0.015),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            MyTextInput(
                hint: 'Enter username',
                controller: _username,
                obscureText: false,
                type: TextInputType.name,
                child: const Icon(
                  Icons.mail_outline,
                  color: Colors.grey,
                )),
            SizedBox(
              height: size.height * 0.02,
            ),
            MyTextInput(
                hint: 'Enter Email',
                controller: _email,
                obscureText: false,
                type: TextInputType.emailAddress,
                child: const Icon(
                  Icons.mail_outline,
                  color: Colors.grey,
                )),
            SizedBox(
              height: size.height * 0.02,
            ),
            MyTextInput(
                hint: 'Create Password',
                controller: _password,
                obscureText: showPassword,
                type: TextInputType.name,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  child: Icon(
                    showPassword
                        ? Iconsax.security
                        : Icons.remove_red_eye_outlined,
                    color: Colors.grey,
                  ),
                )),
            SizedBox(
              height: size.height * 0.05,
            ),
            Center(
                child: MyButton(
                    name: 'Register',
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NavPage()),
                      );
                    })),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Divider(
              color: mygrey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const LoginPage()));
                  },
                  child: const Text(
                    'Already a user? Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
