import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mombien_test/config_test/features/authentification/controllers/onboarding_controller/onboarding_controller.dart';
import 'package:mombien_test/config_test/features/authentification/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:mombien_test/config_test/features/authentification/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:mombien_test/config_test/features/authentification/screens/onboarding/widgets/onboarding_page.dart';
import 'package:mombien_test/config_test/features/authentification/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:mombien_test/config_test/utils/constants/colors.dart';
import 'package:mombien_test/config_test/utils/constants/image_strings.dart';
import 'package:mombien_test/config_test/utils/constants/text_strings.dart';
import 'package:mombien_test/config_test/utils/helpers/helper_functions.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      backgroundColor:
          THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
      body: Stack(
        children: [
          /// Scroll Horizontal
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Bouton Skip
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Boutton Circulaire
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
