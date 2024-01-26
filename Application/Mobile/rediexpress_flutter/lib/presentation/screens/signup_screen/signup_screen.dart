import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rediexpress_flutter/presentation/widgets/my_button_filled.dart';
import 'package:rediexpress_flutter/presentation/widgets/my_textfield.dart';
import 'package:rediexpress_flutter/providers/theme/theme_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController _fioController;
  bool termCB = false;

  @override
  void initState() {
    // TODO: implement initState
    this._fioController = TextEditingController();
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
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              MyTextField(
                hidable: false,
                header: "Full name",
                formatters: [],
                keyboardtype: TextInputType.name,
                hint: "Ivanov Ivan",
                validator: (val){},
                controller: _fioController,
              ),
              const SizedBox(
                height: 24,
              ),
              MyTextField(
                hidable: false,
                header: "Phone number",
                validator: null,
                formatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  phoneMask
                ],
                keyboardtype: TextInputType.phone,
                hint: "+7(999)999-99-99",
                controller: _fioController,
              ),
              const SizedBox(
                height: 24,
              ),
              MyTextField(
                hidable: false,
                validator: (value) {
                    if (value != null && value != "") {
                      if (EmailValidator.validate(value!)) {
                      } else {
                        return 'err';
                      }
                    }
                    return 'err';
                  },
                header: "Email adress",
                formatters: [
                  //idk how to make it
                ],
                keyboardtype: TextInputType.emailAddress,
                hint: "*********@gmail.com",
                controller: _fioController,
              ),
              const SizedBox(
                height: 24,
              ),
              MyTextField(
                validator: null,
                hidable: true,
                header: "Password",
                formatters: [],
                keyboardtype: TextInputType.phone,
                hint: "********",
                controller: _fioController,
              ),
              const SizedBox(
                height: 24,
              ),
              MyTextField(
                validator: null,
                hidable: true,
                header: "Confirm Password",
                formatters: [],
                keyboardtype: TextInputType.none,
                hint: "********",
                controller: _fioController,
              ),
              const SizedBox(
                height: 24,
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
                            setState(() {
                              termCB = value ?? false;
                            });
                          }),
                    ),
                    const SizedBox(width: 10,),
                    LimitedBox(
                      maxWidth: 300,
                      child: Expanded(
                        child: RichText(
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.center,
                          softWrap: true,
                            text: TextSpan(
                          text: 'By ticking this box, you agree to our',
                          style: GoogleFonts.roboto(color: Theme.of(context).colorScheme.inverseSurface),
                          children: <TextSpan>[
                            TextSpan(text: ' Terms and conditions and private policy',style: GoogleFonts.roboto(color: const Color.fromARGB(255, 235, 188, 46) ))
                          ],
                        )),
                      ),
                    )
                  ],
                ),
              ),
              MyButtonFilled(onClick: (){ Provider.of<ThemeProvider>(context, listen: false).switchTheme(); }, width: double.infinity, height: 45, fontSize: 16, text: "Sign Up")
            ],
          ),
        ),
      ),
    );
  }
}
