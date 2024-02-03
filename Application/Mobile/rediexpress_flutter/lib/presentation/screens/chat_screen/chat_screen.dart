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
        body: SafeArea(
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
              ),
              ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: ChatBlock(
                        image: "",
                        name: "",
                        message: "",
                        unreadedCount: 1,
                      ),
                    );
                  })
            ],
          ),
        )));
  }
}

final List<Chat> chatInfo = [];

class ChatBlock extends StatelessWidget {
  final String image;
  final String name;
  final String message;
  final int unreadedCount;

  const ChatBlock({
    super.key,
    required this.image,
    required this.name,
    required this.message,
    required this.unreadedCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(color: Color.fromARGB(255, 167, 167, 167), width: 1)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Color.fromARGB(255, 207, 207, 207)),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(image),
                  )),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.inverseSurface),
                  ),
                  Text(
                    message,
                    style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.inverseSurface),
                  ),
                ],
              ),
            ),
            unreadedCount > 0
                ? Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.primary),
                    child: Center(
                        child: Text(
                      "1",
                      style: GoogleFonts.roboto(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
