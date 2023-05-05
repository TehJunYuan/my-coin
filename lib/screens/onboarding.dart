/* 
  imported packages
    - services
    - introduction_screen
  existing packages
    - material
  app file
    - main
*/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../main.dart';

// onboarding screen class 
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    super.initState();
  }

  Widget _buildImage(String assetName, [double width = 200]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    final bodyStyle = TextStyle(fontSize: 19.0, color: Colors.grey[350]);

    /*
      Function : constant the decoration of page
      Last updated : 10 April 2023 
    */
    final pageDecoration = PageDecoration(
      titleTextStyle: const TextStyle(
        fontSize: 28.0, 
        fontWeight: FontWeight.w700, 
        color: Colors.purple
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.grey.shade900,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      /*
        Function : each model represent each page of the boarding page. Each model consist of title, iamge, body and decoration. The decoration is used the constant page decoration above.
        Last udpated : 10 April 2023
      */
      pages: [
        PageViewModel(
          title: 'Cryptocurrency Prices by Market Cap',
          body: 'Largest collection of unbiased crypto market data, '
                'actionable insights, news, tools, and more in one place.',
          image: _buildImage('onboarding_01.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Industry-trusted Crypto Prices',
          body: 'Invested? Interested in Crypto?'
                'Stay updated with the markets using the ultimate crypto app powered'
                ' by our live, industry-trusted data.',
          image: _buildImage('onboarding_02.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Explore - News, Trends, Guides & More.',
          body: 'Stay up to date with the latest news and never miss a beat.' 
                'Get relevant coverage from leading crypto media outlets, '
                'learn about blockchain or receive updates directly from crypto teams.',
          image: _buildImage('onboarding_03.png'),
          decoration: pageDecoration,
        ),
      ],
      globalBackgroundColor: Colors.grey[900],
      showSkipButton: false,
      showDoneButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      /*
        Function : back button on boarding page. Navigate user back to the previous page. It will show after the first page.
        Last updated : 10 April 2023 
      */
      back: const Text('Back',
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.deepPurpleAccent)),
      /*
        Function : next button on boarding page. Navigate user to the next page. It will not show at the last page.
        Last updated : 10 April 2023 
      */
      next: const Text('Next',
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.deepPurpleAccent)),
      /*
        Function : done button on boarding page. Navigate user to the home page. Only show in the last page.
        Last updated : 10 April 2023 
      */
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
      /*
        Function : navigate the user to home page when they finish the boadring page
        Last updated : 10 April 2023 
      */
      onDone: () {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => const Home())));
      },
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),

      /*
        Function : decorate the dots that shwo the step on boarding page of the user.
        Last updated : 10 April 2023 
      */
      dotsDecorator: DotsDecorator(
        size: const Size(8.0, 8.0),
        color: Colors.purple.shade100,
        activeSize: const Size(15.0, 5.0),
        activeColor: Colors.purple.shade700,
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
