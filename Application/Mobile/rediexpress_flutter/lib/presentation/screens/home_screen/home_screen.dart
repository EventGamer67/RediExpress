import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rediexpress_flutter/presentation/screens/pages/home_page.dart';
import 'package:rediexpress_flutter/presentation/screens/pages/profile_page/profile_page.dart';
import 'package:rediexpress_flutter/presentation/screens/pages/track_page.dart';
import 'package:rediexpress_flutter/presentation/screens/pages/wallet_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  _goToPage(int index) {
    setState(() {
      pageIndex = index;
    });
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutSine);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) {},
            children: pages),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          _goToPage(value);
        },
        enableFeedback: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 5,
        items: List.generate(4, (index) {
          return BottomNavigationBarItem(
              icon: Column(
                children: [
                  Transform.translate(
                    offset: const Offset(0, -8),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      transformAlignment: Alignment.topCenter,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      height: 3,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: pageIndex == index
                              ? [
                                  BoxShadow(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      blurRadius: 1),
                                ]
                              : null,
                          color: pageIndex == index
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 24,
                    height: 24,
                    child: pageIndex == index
                        ? SvgPicture.asset(
                            navbarWidgets[index].image,
                            color: Theme.of(context).colorScheme.primary,
                          )
                        : SvgPicture.asset(
                            navbarWidgets[index].unSelectedImage),
                  )
                ],
              ),
              label: navbarWidgets[index].name);
        }).toList(),
      ),
    );
  }
}

final pages = [
  const HomePage(),
  const WalletPage(),
  const TrackPage(),
  const ProfilePage()
];

List<NavBarIcon> navbarWidgets = [
  const NavBarIcon(
      image: "assets/svg/vuesax/navbar/house-2.svg",
      name: "Home",
      unSelectedImage: "assets/svg/vuesax/linear/house-2.svg"),
  const NavBarIcon(
      image: "assets/svg/vuesax/bold/wallet-3.svg",
      name: "Wallet",
      unSelectedImage: "assets/svg/vuesax/linear/wallet-3.svg"),
  const NavBarIcon(
      image: "assets/svg/vuesax/navbar/smart-car.svg",
      name: "Track",
      unSelectedImage: "assets/svg/vuesax/linear/smart-car.svg"),
  const NavBarIcon(
      image: "assets/svg/vuesax/navbar/profile-circle.svg",
      name: "Profile",
      unSelectedImage: "assets/svg/vuesax/linear/profile-circle.svg")
];

class NavBarIcon extends StatelessWidget {
  final String image;
  final String name;
  final String unSelectedImage;
  const NavBarIcon(
      {super.key,
      required this.image,
      required this.name,
      required this.unSelectedImage});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
