import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:HeritageHub/common/widgets/products.cart/add_remove_button.dart';
import 'package:HeritageHub/common/widgets/products.cart/cart_item.dart';
import 'package:HeritageHub/common/widgets/texts/product_price_text.dart';
import 'package:HeritageHub/utils/constants/sizes.dart';
import 'package:HeritageHub/features/shop/screens/cart/widgets/cart_controller.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemove = true});

  final bool showAddRemove;

  @override
  Widget build(BuildContext context) {
    // Fetch CartController instance
    final cartController = Get.find<CartController>();

    return Obx(() {
      if (cartController.cartItems.isEmpty) {
        return const Center(child: Text('Your cart is empty.'));
      }

      return ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(TSizes.md),
        separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
        itemCount: cartController.cartItems.length,
        itemBuilder: (_, index) {
          final item = cartController.cartItems[index]; // ✅ Get individual item

          return _buildCartItem(context, item);
        },
      );
    });
  }

  /// Builds a single cart item with Add/Remove buttons & price
  Widget _buildCartItem(BuildContext context, CartItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Cart Item
        TCartItem(item: item), // ✅ Pass item dynamically

        if (showAddRemove) const SizedBox(height: TSizes.spaceBtwItems),

        if (showAddRemove)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Add/Remove Button
              TProductAddRemove(item: item), // ✅ Dynamic control

              /// Dynamic Product Price
              TProductPriceText(price: '${item.price.toStringAsFixed(2)}'), // ✅ Proper price formatting
            ],
          ),
      ],
    );
  }
}
