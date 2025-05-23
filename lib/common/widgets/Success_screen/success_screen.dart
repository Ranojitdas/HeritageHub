import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:HeritageHub/common/styles/spacing_style.dart';
import 'package:HeritageHub/features/authentication/screens/login/login.dart';
import 'package:HeritageHub/utils/constants/sizes.dart';
import 'package:HeritageHub/utils/constants/text_strings.dart';
import 'package:HeritageHub/utils/helpers/helper_functions.dart';

import '../../../features/authentication/screens/signup/verify_email.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title,subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              ///Image
              Image(image: AssetImage(image),width: THelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: TSizes.spaceBtwSections,),


              ///Title and Subtitle

              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Text('Thank you! Your contribution directly benefits Indian artisans, enabling them to continue their craft and improve their livelihoods', style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),

              const SizedBox(height : TSizes.spaceBtwSections),
              ///Buttons
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onPressed , child: const Text(TTexts.tContinue),),),
            ],
          ),
        ),

      ),






    );
  }
}

