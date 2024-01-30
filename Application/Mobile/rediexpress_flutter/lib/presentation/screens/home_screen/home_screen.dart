import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  _goToPage(int index) {
    pageController.animateToPage(index,
        duration: Duration(microseconds: 300), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (value) {},
          children: [
            Center(child: Text("Home")),
            Center(child: Text("Home2")),
            Center(child: Text("Home2")),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 110,
        child: Stack(children: [
          Container(
            margin: EdgeInsets.only(top: 7),
            height: double.infinity,
            alignment: Alignment.bottomLeft,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 5,
                  spreadRadius: 5)
            ]),
          ),
          BottomNavigationBar(
            enableFeedback: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        width: 40,
                        height: 3,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                                  offset: Offset(0, 2),
                                  blurRadius: 2,
                                  spreadRadius: 0.5)
                            ]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SvgPicture.asset(
                        'assets/svg/vuesax/navbar/house-2.svg',
                        width: 24,
                        height: 24,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  activeIcon: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        width: 40,
                        height: 3,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                                  offset: Offset(0, 2),
                                  blurRadius: 2,
                                  spreadRadius: 0.5)
                            ]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SvgPicture.asset(
                        'assets/svg/vuesax/navbar/house-2.svg',
                        width: 24,
                        height: 24,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        width: 40,
                        height: 3,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                                  offset: Offset(0, 2),
                                  blurRadius: 2,
                                  spreadRadius: 0.5)
                            ]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SvgPicture.asset(
                        'assets/svg/vuesax/navbar/house-2.svg',
                        width: 24,
                        height: 24,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  activeIcon: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        width: 40,
                        height: 3,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                                  offset: Offset(0, 2),
                                  blurRadius: 2,
                                  spreadRadius: 0.5)
                            ]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SvgPicture.asset(
                        'assets/svg/vuesax/navbar/house-2.svg',
                        width: 24,
                        height: 24,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  label: "Home"),
                  BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        width: 40,
                        height: 3,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                                  offset: Offset(0, 2),
                                  blurRadius: 2,
                                  spreadRadius: 0.5)
                            ]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SvgPicture.asset(
                        'assets/svg/vuesax/navbar/house-2.svg',
                        width: 24,
                        height: 24,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  activeIcon: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        width: 40,
                        height: 3,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                                  offset: Offset(0, 2),
                                  blurRadius: 2,
                                  spreadRadius: 0.5)
                            ]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SvgPicture.asset(
                        'assets/svg/vuesax/navbar/house-2.svg',
                        width: 24,
                        height: 24,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  label: "Home"),
                  BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        width: 40,
                        height: 3,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                                  offset: Offset(0, 2),
                                  blurRadius: 2,
                                  spreadRadius: 0.5)
                            ]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SvgPicture.asset(
                        'assets/svg/vuesax/navbar/house-2.svg',
                        width: 24,
                        height: 24,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  activeIcon: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        width: 40,
                        height: 3,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                                  offset: Offset(0, 2),
                                  blurRadius: 2,
                                  spreadRadius: 0.5)
                            ]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SvgPicture.asset(
                        'assets/svg/vuesax/navbar/house-2.svg',
                        width: 24,
                        height: 24,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  label: "Home"),
                  BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        width: 40,
                        height: 3,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                                  offset: Offset(0, 2),
                                  blurRadius: 2,
                                  spreadRadius: 0.5)
                            ]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SvgPicture.asset(
                        'assets/svg/vuesax/navbar/house-2.svg',
                        width: 24,
                        height: 24,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  activeIcon: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        width: 40,
                        height: 3,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                                  offset: Offset(0, 2),
                                  blurRadius: 2,
                                  spreadRadius: 0.5)
                            ]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SvgPicture.asset(
                        'assets/svg/vuesax/navbar/house-2.svg',
                        width: 24,
                        height: 24,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  label: "Home"),
            ],
          ),
        ]),
      ),
    );
  }
}
