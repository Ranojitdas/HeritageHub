import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:HeritageHub/common/widgets/icons/t_circular_icon.dart';
import 'package:HeritageHub/features/shop/screens/cart/widgets/cart_controller.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TBottomAddToCart extends StatelessWidget {
  final String productName;
  final double productPrice;

  const TBottomAddToCart({
    super.key,
    required this.productName,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: const BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => cartController.removeItem(productName),
                child: const TCircularIcon(icon: Iconsax.minus,
                  backgroundColor: TColors.darkGrey,
                  width: 40,
                  height: 40,
                  color: TColors.white,),
              ),
              const SizedBox(width: 16),
              Obx(() {
                final item = cartController.cartItems
                    .firstWhereOrNull((item) => item.name == productName);
                return Text(
                  '${item?.quantity.value ?? 0}',
                  style: Theme.of(context).textTheme.headlineSmall,
                );
              }),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () => cartController.addItem(productName, productPrice),
                child: const TCircularIcon(icon: Iconsax.add,
                  backgroundColor: TColors.black,
                  width: 40,
                  height: 40,
                  color: TColors.white,),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                cartController.addItem(productName, productPrice);
                Get.snackbar("Cart Updated", "$productName added to cart!");
              },

              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(TSizes.md),
                  backgroundColor: TColors.black,
                  side: const BorderSide(color: TColors.black)
              ),
              child: const Text('Add to Cart'))
        ],
      ),
    );
  }
}
