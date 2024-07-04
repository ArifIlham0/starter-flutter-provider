import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:starter_frontend_flutter/constants/app_constants.dart';
import 'package:starter_frontend_flutter/controllers/onboarding_provider.dart';
import 'package:starter_frontend_flutter/theme.dart';
import 'package:starter_frontend_flutter/views/ui/onboarding/page_one.dart';
import 'package:starter_frontend_flutter/views/ui/onboarding/page_three.dart';
import 'package:starter_frontend_flutter/views/ui/onboarding/page_two.dart';
import 'package:starter_frontend_flutter/views/widgets/exports.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();

  dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<OnBoardProvider>(
          builder: (context, onBoardProvider, child) {
            return Stack(
              children: [
                PageView(
                  physics: onBoardProvider.isLastPage
                      ? NeverScrollableScrollPhysics()
                      : AlwaysScrollableScrollPhysics(),
                  controller: pageController,
                  onPageChanged: (page) {
                    onBoardProvider.isLastPage = page == 2;
                  },
                  children: [
                    PageOne(),
                    PageTwo(),
                    PageThree(),
                  ],
                ),
                Positioned(
                  bottom: height * 0.07,
                  left: 0,
                  right: 0,
                  child: onBoardProvider.isLastPage
                      ? SizedBox.shrink()
                      : Center(
                          child: SmoothPageIndicator(
                            controller: pageController,
                            count: 3,
                            effect: WormEffect(
                              dotHeight: 9,
                              dotWidth: 9,
                              spacing: 10,
                              dotColor: kDarkGrey.withOpacity(0.5),
                              activeDotColor: kGreen,
                            ),
                          ),
                        ),
                ),
                Positioned(
                  child: onBoardProvider.isLastPage
                      ? SizedBox.shrink()
                      : Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 20.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    pageController.jumpToPage(2);
                                  },
                                  child: ReusableText(
                                    text: "Skip",
                                    style:
                                        textStyles(14, kWhite, FontWeight.w500),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    pageController.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.ease,
                                    );
                                  },
                                  child: ReusableText(
                                    text: "Next",
                                    style:
                                        textStyles(14, kWhite, FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
