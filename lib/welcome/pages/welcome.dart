import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:handy_helper_main/common/utils/constants.dart';
import 'package:handy_helper_main/common/widgets/app_style.dart';
import 'package:handy_helper_main/common/widgets/reusable_text.dart';
import 'package:handy_helper_main/common/widgets/width_spacer.dart';
import 'package:handy_helper_main/welcome/widgets/intro_page_one.dart';
import 'package:handy_helper_main/welcome/widgets/intro_page_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: AlwaysScrollableScrollPhysics(),
            controller: pageController,
            children: [
              const IntroPageOne(),
              const IntroPageTwo(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          pageController.nextPage(
                              duration: Duration(milliseconds: 600),
                              curve: Curves.ease);
                        },
                        child: const Icon(
                          Ionicons.chevron_forward_circle,
                          size: 30,
                          color: AppConst.kLight,
                        ),
                      ),
                      const WidthSpacer(wydth: 5),
                      ReusableText(
                        text: "skip",
                        style: appStyle(16, AppConst.kLight, FontWeight.w500),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      pageController.nextPage(
                          duration: Duration(milliseconds: 100),
                          curve: Curves.ease);
                    },
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 2,
                      effect: WormEffect(
                          dotHeight: 12,
                          dotWidth: 16,
                          spacing: 10,
                          dotColor: AppConst.kYellow),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
