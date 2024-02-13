import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rediexpress_flutter/presentation/screens/login_screen/login_screen.dart';
import 'package:rediexpress_flutter/presentation/widgets/my_button_filled.dart';
import 'package:rediexpress_flutter/presentation/widgets/my_textfield.dart';
import 'package:rediexpress_flutter/providers/theme/theme_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController _fioController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  bool termCB = false;
  bool correct = false;

  @override
  void initState() {
    _fioController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  _checkCorrect() {
    bool res = false;
    String fio = _fioController.text;
    String phone = _phoneController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String confpassword = _confirmPasswordController.text;

    if (termCB) {
      res = true;
    }
    if (fio.isEmpty ||
        phone.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confpassword.isEmpty) {
      res = false;
    }
    if (!EmailValidator.validate(email)) {
      res = false;
    }

    if (password != confpassword) {
      res = false;
    }

    setState(() {
      correct = res;
    });
  }

  _signUp() async {
    AuthResponse response = await GetIt.I.get<Supabase>().client.auth.signUp(
        password:
            sha256.convert(utf8.encode(_passwordController.text)).toString(),
        email: _emailController.text,
        data: {
          "fullname": _fioController.text,
          "phone": _phoneController.text
        });
    GetIt.I.get<Talker>().good(response.user);
  }

  _googleSign() async {
    GetIt.I.get<Talker>().debug("msg");
    Supabase sup = GetIt.I.get<Supabase>();
    bool res = await sup.client.auth.signInWithOAuth(OAuthProvider.google);
    GetIt.I.get<Talker>().debug(res);
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
              Text(
                "Create an account",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.inverseSurface),
              ),
              Text("Complete the sign up process to get started",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: const Color.fromARGB(255, 167, 167, 167),
                  )),
              SizedBox(
                height: 20,
              ),
              MyTextField(
                hidable: false,
                header: "Full name",
                formatters: const [],
                keyboardtype: TextInputType.name,
                hint: "Ivanov Ivan",
                validator: (val) {
                  return null;
                },
                controller: _fioController,
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                hidable: false,
                header: "Phone number",
                validator: null,
                formatters: [FilteringTextInputFormatter.digitsOnly, phoneMask],
                keyboardtype: TextInputType.phone,
                hint: "+7(999)999-99-99",
                controller: _phoneController,
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                hidable: false,
                validator: null,
                header: "Email adress",
                formatters: const [
                  //idk how to make it
                ],
                keyboardtype: TextInputType.emailAddress,
                hint: "*********@gmail.com",
                controller: _emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                validator: null,
                hidable: true,
                header: "Password",
                formatters: const [],
                keyboardtype: TextInputType.phone,
                hint: "********",
                controller: _passwordController,
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                validator: null,
                hidable: true,
                header: "Confirm Password",
                formatters: const [],
                keyboardtype: TextInputType.none,
                hint: "********",
                controller: _confirmPasswordController,
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1),
                          activeColor: Theme.of(context).colorScheme.primary,
                          value: termCB,
                          onChanged: (value) {
                            termCB = value!;
                            _checkCorrect();
                          }),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 300,
                      height: 35,
                      child: RichText(
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          text: TextSpan(
                            text: 'By ticking this box, you agree to our',
                            style: GoogleFonts.roboto(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inverseSurface),
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      ' Terms and conditions and private policy',
                                  style: GoogleFonts.roboto(
                                      color: const Color.fromARGB(
                                          255, 235, 188, 46)))
                            ],
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              MyButtonFilled(
                  enabled: correct,
                  onClick: () {
                    _signUp();
                  },
                  width: double.infinity,
                  height: 45,
                  fontSize: 16,
                  text: "Sign Up"),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(
                        color: Color(0xFFA6A6A6), fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                            },
                          text: "Sign in",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary))
                    ]),
              ),
              const SizedBox(
                height: 17,
              ),
              GestureDetector(
                onTap: () {
                  _googleSign();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: const TextSpan(
                          text: "Or sign in using",
                          style: TextStyle(
                              color: Color(0xFFA6A6A6),
                              fontWeight: FontWeight.w400),
                          children: []),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                        width: 16,
                        height: 16,
                        child: SvgPicture.asset(
                          'assets/svg/vuesax/linear/Facebook google, apple.svg',
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
