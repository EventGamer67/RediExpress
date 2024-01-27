import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rediexpress_flutter/presentation/screens/forgotpassword_screen/forgotpassword_screen.dart';
import 'package:rediexpress_flutter/presentation/widgets/my_button_filled.dart';
import 'package:rediexpress_flutter/presentation/widgets/my_textfield.dart';
import 'package:rediexpress_flutter/providers/theme/theme_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _fioController;
  bool termCB = false;

  @override
  void initState() {
    _fioController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
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
                      "Welcome back",
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Theme.of(context).colorScheme.inverseSurface),
                    ),
                    Text("Fill in your email and password to continue",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: const Color.fromARGB(255, 167, 167, 167),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                hidable: false,
                validator: null,
                // validator: (value) {
                //   if (value != null && value != "") {
                //     if (EmailValidator.validate(value!)) {
                //     } else {
                //       return 'err';
                //     }
                //   }
                //   return 'err';
                // },
                header: "Email adress",
                formatters: const [
                  //idk how to make it
                ],
                keyboardtype: TextInputType.emailAddress,
                hint: "*********@gmail.com",
                controller: _fioController,
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
                controller: _fioController,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                              side: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1),
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              value: termCB,
                              onChanged: (value) {
                                setState(() {
                                  termCB = value ?? false;
                                });
                              }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Remember password',
                          style: GoogleFonts.roboto(
                              color:
                                  Theme.of(context).colorScheme.inverseSurface),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ForgotPasswordScreen() ));
                      },
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 190,
              ),
              MyButtonFilled(
                  enabled: false,
                  onClick: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .switchTheme();
                  },
                  width: double.infinity,
                  height: 45,
                  fontSize: 16,
                  text: "Log in"),
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
                          text: "Sign in",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary))
                    ]),
              ),
              const SizedBox(
                height: 17,
              ),
              RichText(
                text: const TextSpan(
                    text: "Or sign in using",
                    style: TextStyle(
                        color: Color(0xFFA6A6A6), fontWeight: FontWeight.w400),
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
        ),
      ),
    );
  }
}
