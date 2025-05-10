import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:HeritageHub/features/shop/screens/cart/widgets/cart_controller.dart';
import 'package:HeritageHub/common/widgets/appbar/appbar.dart';
import 'package:HeritageHub/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:HeritageHub/utils/constants/sizes.dart';

import '../../../../common/widgets/Success_screen/success_screen.dart';
import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/products.cart/coupon_card.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../checkout/widgets/billing_address.dart';
import '../checkout/widgets/billing_amount.dart';
import '../checkout/widgets/billing_payments.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch CartController instance
    final cartController = Get.find<CartController>();

    return Scaffold(
      appBar: TAppbar(
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return const Center(child: Text('Your cart is empty.'));
        }
        return Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: const TCartItems(showAddRemove: true), // ✅ Dynamic cart items
        );
      }),
      bottomNavigationBar: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
            onPressed: cartController.cartItems.isNotEmpty
                ? () => Get.to(() => const CheckOutScreen())
                : null,
            child: Text(
              'Checkout ₹${cartController.totalPrice.value.toStringAsFixed(2)}', // ✅ Dynamic price
            ),
          ),
        );
      }),
    );
  }
}

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppbar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Items in Cart
            const TCartItems(showAddRemove: false),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Coupon
            const TCouponCode(),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Billing Section
            TRoundedContainer(
              showBorder: true,
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.black : TColors.white,
              child: const Column(
                children: [
                  TBillingAmount(), // ✅ Dynamic billing details
                  SizedBox(height: TSizes.spaceBtwItems),
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems),
                  TBillingPayment(), // ✅ Payment method selection
                  SizedBox(height: TSizes.spaceBtwItems),
                  TBillingAddress(), // ✅ Billing Address
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Obx(() {
          return ElevatedButton(
            onPressed: () => Get.to(
              () => SuccessScreen(
                image: TImages.successfulPaymentIcon,
                title: 'Payment Success',
                subTitle: 'Your Handicraft will be shipped soon',
                onPressed: () => Get.offAll(
                    () => const NavigationMenu()), // ✅ Navigate to home
              ),
            ),
            child: Text(
              'Checkout ${cartController.totalPrice.value.toStringAsFixed(2)}', // ✅ Dynamic total price
            ),
          );
        }),
      ),
    );
  }
}
