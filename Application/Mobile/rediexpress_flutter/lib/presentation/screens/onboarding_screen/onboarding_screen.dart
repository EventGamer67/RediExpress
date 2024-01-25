// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rediexpress_flutter/presentation/widgets/my_button_filled.dart';
import 'package:rediexpress_flutter/presentation/widgets/my_button_outlined.dart';
import 'package:rediexpress_flutter/providers/theme/theme_provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  int pageIndex = 0;
  final List<OnBoardPageInfo> pages = [
    OnBoardPageInfo(
      title: "Quick Delivery At Your Doorstep",
      desc: "Enjoy quick pick-up and delivery to your destination",
      image: 'assets/svg/1.svg',
    ),
    OnBoardPageInfo(
      title: "Flexible Payment",
      desc:
          "Different modes of payment either before and after delivery without stress",
      image: 'assets/svg/2.svg',
    ),
    OnBoardPageInfo(
      title: "Real-time Tracking",
      desc:
          "Track your packages/items from the comfort of your home till final destination",
      image: 'assets/svg/3.svg',
    )
  ];

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  void _pageChanged(int index) {
    this.pageIndex = index;
    setState(() {});
  }

  _nextPage() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  _goToEnd() {
    _pageController.jumpToPage(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Provider.of<ThemeProvider>(context).theme.colorScheme.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LimitedBox(
                maxHeight: MediaQuery.of(context).size.width,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (value) {
                    _pageChanged(value);
                  },
                  children:
                      pages.map((e) => SvgPicture.asset(e.image)).toList(),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        pages[pageIndex].title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.primary),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      alignment: Alignment.topCenter,
                      child: Text(
                        pages[pageIndex].desc,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color:
                                Theme.of(context).colorScheme.inverseSurface),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 82,
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: pageIndex == pages.length - 1
                  ? Column(
                      children: [
                        MyButtonFilled(
                            fontSize: 16,
                            width: double.infinity,
                            height: 46,
                            onClick: _nextPage,
                            text: "Sign Up"),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Already have an account?",
                              style: const TextStyle(
                                  color: Color(0xFFA6A6A6),
                                  fontWeight: FontWeight.w400),
                              children: [
                                TextSpan(
                                    text: "Sign Up",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary))
                              ]),
                        ),
                        const SizedBox(
                          height: 1,
                        )
                      ],
                    )
                  : Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyButtonOutlined(
                            onClick: _goToEnd,
                            width: 100,
                            height: 50,
                            text: "Skip",
                          ),
                          MyButtonFilled(
                              fontSize: 14,
                              onClick: _nextPage,
                              width: 100,
                              height: 50,
                              text: "Next")
                        ],
                      )
                    ]),
            )
          ],
        ),
      ),
    );
  }
}

class OnBoardPageInfo {
  String desc;
  String title;
  String image;
  OnBoardPageInfo(
      {required this.desc, required this.title, required this.image});
}
