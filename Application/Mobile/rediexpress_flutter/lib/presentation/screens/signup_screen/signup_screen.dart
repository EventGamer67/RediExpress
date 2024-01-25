import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rediexpress_flutter/presentation/widgets/my_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController _fioController;
  @override
  void initState() {
    // TODO: implement initState
    this._fioController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
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
                        color: Color.fromARGB(255, 167, 167, 167),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            MyTextField(
              hidable: false,
              header: "Full name",
              formatters: [],
              keyboardtype: TextInputType.name,
              hint: "Ivanov Ivan",
              controller: _fioController,
            ),
            SizedBox(
              height: 24,
            ),
            MyTextField(
              hidable: false,
              header: "Phone number",
              formatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardtype: TextInputType.phone,
              hint: "+7(999)999-99-99",
              controller: _fioController,
            ),
            SizedBox(
              height: 24,
            ),
            MyTextField(
              hidable: false,
              header: "Email adress",
              formatters: [
                //idk how to make it
              ],
              keyboardtype: TextInputType.emailAddress,
              hint: "*********@gmail.com",
              controller: _fioController,
            ),
            SizedBox(
              height: 24,
            ),
            MyTextField(
              hidable: true,
              header: "Password",
              formatters: [
              ],
              keyboardtype: TextInputType.phone,
              hint: "********",
              controller: _fioController,
            ),
            SizedBox(
              height: 24,
            ),
            MyTextField(
              hidable: true,
              header: "Confirm Password",
              formatters: [
              ],
              keyboardtype: TextInputType.none,
              hint: "********",
              controller: _fioController,
            )
          ],
        ),
      ),
    );
  }
}
