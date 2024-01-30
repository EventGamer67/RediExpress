import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rediexpress_flutter/presentation/screens/home_screen/home_screen.dart';
import 'package:rediexpress_flutter/presentation/widgets/my_button_filled.dart';
import 'package:rediexpress_flutter/presentation/widgets/my_textfield.dart';
import 'package:rediexpress_flutter/providers/theme/theme_provider.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  late final passwordcontroller;
  late final retrypasswordcontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordcontroller = TextEditingController();
    retrypasswordcontroller = TextEditingController();
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
                // validator: (value) {
                //   if (value != null && value != "") {
                //     if (EmailValidator.validate(value!)) {
                //     } else {
                //       return 'err';
                //     }
                //   }
                //   return 'err';
                // },
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
                  enabled: true,
                  onClick: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen() ));

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