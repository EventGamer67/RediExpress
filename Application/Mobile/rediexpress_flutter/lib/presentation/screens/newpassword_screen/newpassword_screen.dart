import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rediexpress_flutter/presentation/screens/home_screen/home_screen.dart';
import 'package:rediexpress_flutter/presentation/widgets/my_button_filled.dart';
import 'package:rediexpress_flutter/presentation/widgets/my_textfield.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

class NewPasswordScreen extends StatefulWidget {
  final String email;
  const NewPasswordScreen({super.key, required this.email});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  late final passwordcontroller;
  late final retrypasswordcontroller;
  bool correct = false;

  @override
  void initState() {
    super.initState();
    passwordcontroller = TextEditingController();
    retrypasswordcontroller = TextEditingController();
  }

  _resetPassword() async {
    try {
      dynamic res = await GetIt.I.get<Supabase>().client.auth.updateUser(
          UserAttributes(
              email: widget.email, password: sha256.convert(utf8.encode(passwordcontroller.text)).toString()));
      GetIt.I.get<Talker>().debug(res);
      if (res is UserResponse) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const HomeScreen(
                  startpage: 0,
                )));
      }
    } catch (err) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(err.toString())));
    }
  }

  _checkCorrect() {
    String pass = passwordcontroller.text;
    String confpass = retrypasswordcontroller.text;

    if (pass.isEmpty | confpass.isEmpty) {
      correct = false;
    } else {
      if (pass == confpass) {
        correct = true;
      } else {
        correct = false;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          onChanged: () {
            _checkCorrect();
          },
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "New Password",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Theme.of(context).colorScheme.inverseSurface),
                    ),
                    Text("Enter new password",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: const Color.fromARGB(255, 167, 167, 167),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              MyTextField(
                hidable: true,
                validator: null,
                header: "Password",
                formatters: const [
                  //idk how to make it
                ],
                keyboardtype: TextInputType.emailAddress,
                hint: "********",
                controller: passwordcontroller,
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                validator: null,
                hidable: true,
                header: "Confirm Password",
                formatters: const [],
                keyboardtype: TextInputType.phone,
                hint: "********",
                controller: retrypasswordcontroller,
              ),
              const SizedBox(
                height: 70,
              ),
              MyButtonFilled(
                  enabled: correct,
                  onClick: () {
                    _resetPassword();
                  },
                  width: double.infinity,
                  height: 45,
                  fontSize: 16,
                  text: "Log in"),
            ],
          ),
        ),
      ),
    );
  }
}
