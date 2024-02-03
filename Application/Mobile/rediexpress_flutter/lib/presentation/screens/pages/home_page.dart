// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rediexpress_flutter/presentation/screens/chat_screen/chat_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 24,
              ),
              const SearchField(height: 34),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: double.infinity,
                height: 91,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/ProfileInfo.png"))),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 207, 207, 207),
                                width: 1),
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                                image: NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKF22jIPkCNA2ZgyVdnh4IlSRR3GyW8hmeGg&usqp=CAU"))),
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
                            "Hello Ken!",
                            style: GoogleFonts.roboto(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Text(
                            "We trust you are having a great time",
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color:
                                    const Color.fromARGB(255, 207, 207, 207)),
                          )
                        ],
                      )),
                      SvgPicture.asset(
                        "assets/svg/notification.svg",
                        width: 24,
                        height: 24,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const SpecialBlockHomePageBlock(),
              const SizedBox(
                height: 30,
              ),
              const ServicesHomePageBlock()
            ],
          ),
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  final double height;
  const SearchField({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 207, 207, 207),
          borderRadius: BorderRadius.circular(4)),
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Search services",
            style: GoogleFonts.roboto(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 167, 167, 167)),
          ),
          SvgPicture.asset(
            "assets/svg/search-normal.svg",
            width: 12,
            height: 12,
          )
        ],
      ),
    );
  }
}

final List<ServiceBlock> servicesList = [
  ServiceBlock(
      onTap: (context) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const ChatScreen()));
      },
      image: "assets/healthicons_call-centre.svg",
      desc:
          "Our customer care service line is available from 8 -9pm week days and 9 - 5 weekends - tap to call us today",
      title: "Customer Care"),
  ServiceBlock(
      onTap: (context) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const ChatScreen()));
      },
      image: "assets/codicon_package.svg",
      desc: "Request for a driver to pick up or deliver your package for you",
      title: "Send a package"),
  ServiceBlock(
      onTap: (context) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const ChatScreen()));
      },
      image: "assets/21.svg",
      desc:
          "To fund your wallet is as easy as ABC, make use of our fast technology and top-up your wallet today",
      title: "Fund your wallet"),
  ServiceBlock(
      onTap: (context) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const ChatScreen()));
      },
      image: "assets/Vector.svg",
      desc: "Search for available rider within your area",
      title: "Chats")
];

class ServiceBlock {
  final String image;
  final String desc;
  final String title;
  final Function(dynamic) onTap;

  ServiceBlock(
      {required this.image,
      required this.desc,
      required this.title,
      required this.onTap});
}

class ServicesHomePageBlock extends StatelessWidget {
  const ServicesHomePageBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "What would you like to do",
              style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          GridView.builder(
            itemCount: servicesList.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  servicesList[index].onTap.call(context);
                },
                child: Container(
                  width: 160,
                  height: 160,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 1,
                                spreadRadius: 1,
                                offset: const Offset(0, 3))
                          ],
                          color: const Color.fromARGB(255, 242, 242, 242),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 48,
                                width: 48,
                                child: SvgPicture.asset(
                                  servicesList[index].image,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              Text(
                                servicesList[index].title,
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              Text(
                                servicesList[index].desc,
                                style: GoogleFonts.roboto(
                                    fontSize: 7.45,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inverseSurface),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
              );
            },
            // children: [
            //   Container(
            //     width: 160,
            //     height: 160,
            //     decoration: BoxDecoration(
            //         boxShadow: [
            //           BoxShadow(
            //               color: Colors.black,
            //               blurRadius: 1,
            //               offset: Offset(0, 2),
            //               spreadRadius: 1)
            //         ],
            //         color: Colors.greenAccent,
            //         borderRadius: BorderRadius.circular(8)),
            //     child: Text(""),
            //   ),
            //   Container(
            //     width: 160,
            //     height: 160,
            //     color: Colors.red,
            //     child: Text(""),
            //   ),
            //   Container(
            //     width: 160,
            //     height: 160,
            //     color: Colors.red,
            //     child: Text(""),
            //   ),
            //   Container(
            //     width: 160,
            //     height: 160,
            //     color: Colors.red,
            //     child: Text(""),
            //   )
            // ],
          )
          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2))
          // GridView.builder(
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 2),
          //     itemBuilder: (context, indext) {
          //       return Container(
          //         width: 160,
          //         height: 160,
          //         child: Padding(
          //           padding: EdgeInsets.all(8),
          //           child: Container(
          //             decoration: BoxDecoration(color: Colors.red),
          //             child: Text("data"),
          //           ),
          //         ),
          //       );
          //     })
        ],
      ),
    );
  }
}

class SpecialBlockHomePageBlock extends StatelessWidget {
  const SpecialBlockHomePageBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Special for you",
              style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 236, 130, 0)),
            ),
            RotatedBox(
              quarterTurns: 2,
              child: SizedBox(
                width: 24,
                height: 24,
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SvgPicture.asset(
                      "assets/svg/arrow-square-right.svg",
                      width: 24,
                      height: 24,
                      color: const Color.fromARGB(255, 236, 130, 0),
                    )),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 7,
        ),
        Container(
          height: 64,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: specialList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    height: 64,
                    width: 166,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.amber,
                        border: Border.all(
                            color: const Color.fromARGB(255, 236, 130, 0),
                            width: 1),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(specialList[index].image))),
                  ),
                );
              }),
        )
      ],
    );
  }
}

final List<SpecialBlock> specialList = [
  SpecialBlock(image: "assets/Frame 50.png"),
  SpecialBlock(image: "assets/Frame 51.png"),
  SpecialBlock(image: "assets/Frame 53.png"),
  SpecialBlock(image: "assets/Frame 52.png"),
];

class SpecialBlock {
  final String image;
  final Function(dynamic)? onTap;

  SpecialBlock({
    required this.image,
    this.onTap,
  });
}
