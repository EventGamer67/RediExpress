import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rediexpress_flutter/presentation/screens/pages/home_page.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SizedBox(
              width: 24,
              height: 24,
              child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SvgPicture.asset(
                    "assets/svg/arrow-square-right.svg",
                  )),
            ),
          ),
          title: Text(
            "Chats",
            style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 167, 167, 167)),
          ),
        ),
        body: const SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column( 
            children: [
              SizedBox(
                height: 21,
              ),
              SearchField(height: 40),
              SizedBox(
                height: 21,
              )
            ],
          ),
        )));
  }
}
