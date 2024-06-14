import 'package:boumedstore/views/home.view.dart';
import 'package:boumedstore/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  static String id = 'onboarding';

  final List<String> imageList = [
    'assets/images/online-shop-opening-ceremony-illustration-concept-on-white-background-vector.jpg',
    'assets/images/sales-promotion-illustration_335657-4831.avif',
    'assets/images/hands-with-money-flat-composition-with-female-hands-holding-discount-cards-coin-stacks-smartphone-shopping-bags-vector-illustration_1284-80349.avif'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Finally Open',
            body:
                'Embark with us on a new shopping journey ! Opening of our online store Boumed Store,  Boumed Store: Your new destination for distinguished online shopping!,Everything you are looking for is now available in our online store, Boumed Store',
            image: CustomImage(
              image: imageList[0],
            ),
          ),
          PageViewModel(
            title: 'Are you looking for specific products? ',
            body:
                'We have everything you are looking for and more!, Enjoy an easy and safe shopping experience through [store features, such as ease of use, various payment methods, and flexible return policy]...',
            image: CustomImage(
              image: imageList[1],
            ),
          ),
          PageViewModel(
            title: 'Are You Excited !',
            // body: "Let's Go Started",
            bodyWidget: Image.asset(
              'assets/logo/boumed.png',
              height: 150,
              color: Colors.black,
            ),
            image: CustomImage(
              image: imageList[2],
            ),
          ),
        ],
        next: const Icon(
          Icons.arrow_forward,
          size: 30,
        ),
        done: const Text(
          'Done',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        onDone: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(HomeView.id, (route) => false);
        },
        showBackButton: true,
        back: const Icon(
          Icons.arrow_back,
          size: 30,
        ),
        animationDuration: 500,
        dotsDecorator: DotsDecorator(
          size: const Size(10, 10),
          activeSize: const Size(22, 10),
          color: Colors.grey,
          activeColor: Colors.orange,
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
      ),
    );
  }
}
