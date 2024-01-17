import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  late final PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  void _pageChanged(int index){
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Center(
            child:
              PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  _pageChanged(value);
                },
                children: [ 
                  Column(
                    children: [
                      SvgPicture.asset('assets/svg/1.svg',width: MediaQuery.of(context).size.width,),
                      const SizedBox(height: 20,)
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset('assets/svg/2.svg',width: MediaQuery.of(context).size.width,),
                      const SizedBox(height: 20,)
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset('assets/svg/3.svg',width: MediaQuery.of(context).size.width,),
                      const SizedBox(height: 20,)
                    ],
                  )
                ]
              ),
          ),
        ),
      ),
    );
  }
}