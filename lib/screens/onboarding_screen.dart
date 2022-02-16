import 'package:flutter/material.dart';
import 'package:fooderlich/models/app_state_manager.dart';
import 'package:fooderlich/models/foderlich_pages.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: FooderlichPages.onboardingPath,
      key: ValueKey(FooderlichPages.onboardingPath),
      child: const OnboardingScreen(),
    );
  }

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  final rwColor = const Color.fromRGBO(64, 143, 77, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Getting started'),
        leading: GestureDetector(
          child: const Icon(
            Icons.chevron_left,
            size: 35,
          ),
          onTap: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _buildPages(),
            ),
            _buildIndicator(),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          onPressed: () {
            Provider.of<AppStateManager>(context, listen: false).completeOnboarding();
          },
          child: const Text('Skip'),
        ),
      ],
    );
  }

  Widget _buildIndicator() {
    return SmoothPageIndicator(
      controller: _controller,
      count: 3,
      effect: WormEffect(activeDotColor: rwColor),
    );
  }

  Widget _buildPages() {
    return PageView(
      controller: _controller,
      children: [
        onboardPageView(
          const AssetImage('assets/images/recommend.png'),
          '''Check out weekly recommended recipes and what your friends are cooking!''',
        ),
        onboardPageView(
          const AssetImage('assets/images/sheet.png'),
          'Copy with step by step instructions!',
        ),
        onboardPageView(
          const AssetImage('assets/images/list.png'),
          'Keep track of what you need to buy',
        ),
      ],
    );
  }

  Widget onboardPageView(ImageProvider imageProvider, String text) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              fit: BoxFit.fitWidth,
              image: imageProvider,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
