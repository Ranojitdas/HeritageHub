import 'package:flutter/material.dart';
import 'package:HeritageHub/utils/constants/colors.dart';
import 'package:HeritageHub/utils/constants/sizes.dart';
import 'package:HeritageHub/utils/helpers/helper_functions.dart';
import 'package:HeritageHub/features/shop/screens/cart/widgets/cart_controller.dart';

class TCartItem extends StatelessWidget {
  final CartItem item;

  const TCartItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image Placeholder (Replace with actual image logic)
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: THelperFunctions.isDarkMode(context) ? TColors.darkGrey : TColors.light,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Icon(Icons.image, size: 30, color: Colors.grey)),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(item.name, maxLines: 1, style: Theme.of(context).textTheme.bodyLarge),

            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Quality: ', style: Theme.of(context).textTheme.bodySmall),TextSpan(text: CartItem.quality, style: Theme.of(context).textTheme.bodyLarge), // ✅ Static Quality
                  TextSpan(text: '  |  ', style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: 'Available: ', style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: CartItem.isAvailable ? 'Yes' : 'No',
                      style: Theme.of(context).textTheme.bodyLarge), // ✅ Static Availability
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
