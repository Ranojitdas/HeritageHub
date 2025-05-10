import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widgets/Success_screen/success_screen.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../authentication/controllers.onboarding/signup/signup_controller.dart';
import 'billing_amount2.dart';
import 'billing_payments.dart';

class CheckOutScreen2 extends StatefulWidget {
  const CheckOutScreen2({super.key});

  @override
  _CheckOutScreen2State createState() => _CheckOutScreen2State();
}

class _CheckOutScreen2State extends State<CheckOutScreen2> {
  final SignupController controller = Get.put(SignupController());
  double orderTotal = 0.0;

  void updateOrderTotal(double total) {
    setState(() {
      orderTotal = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppbar(
        showBackArrow: true,
        title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    Text("Supporting Artisan Communities", style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// Pricing
                    TBillingAmount2(updateTotal: updateOrderTotal),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// Divider
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// Payment Methods
                    const TBillingPayment(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// **Updated Checkout Button**
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
            image: TImages.successfulPaymentIcon,
            title: 'Payment Success',
            subTitle: 'You successfully paid for the registration fees of your NPDA account',
            onPressed: () => controller.signup(),
          )),
          child: Text('Checkout ${orderTotal.toStringAsFixed(2)} ₹'),
        ),
      ),
    );
  }
}
