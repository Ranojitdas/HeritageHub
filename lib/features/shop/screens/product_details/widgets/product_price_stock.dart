import 'package:flutter/material.dart';
import 'package:HeritageHub/common/widgets/texts/product_price_text.dart';
import 'package:HeritageHub/common/widgets/texts/product_title_text.dart';
import 'package:HeritageHub/utils/constants/sizes.dart';

class TProductMetaData extends StatelessWidget {
  final double price;
  final String stock;

  const TProductMetaData({
    super.key,
    required this.price,
    required this.stock,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price
        Row(
          children: [
            const TProductTitleText(title: 'Price:'),
            const SizedBox(width: TSizes.spaceBtwItems),
            TProductPriceText(price: '${price.toStringAsFixed(2)}', isLarge: true),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// Stock
        Row(
          children: [
            const TProductTitleText(title: 'Status:'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(stock, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
      ],
    );
  }
}
