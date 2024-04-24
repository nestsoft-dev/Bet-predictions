import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/colors.dart';
import '../../widgets/button.dart';
import '../../widgets/textinput.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _username = TextEditingController();

  final _password = TextEditingController();
  bool showPassword = true;

  @override
  void dispose() {
    _username.dispose();

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
              'Login',
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
              'Welcome back user',
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
                hint: 'Enter Password',
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
            Center(child: MyButton(name: 'Login', ontap: () {})),
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
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'New a user? Register',
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
