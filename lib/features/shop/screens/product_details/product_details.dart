import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:HeritageHub/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:HeritageHub/features/shop/screens/product_details/widgets/product_detail_image.dart';
import 'package:HeritageHub/features/shop/screens/product_details/widgets/product_price_stock.dart';
import 'package:HeritageHub/features/shop/screens/product_details/widgets/rating_share.dart';
import 'package:HeritageHub/utils/constants/image_strings.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../cart/cart.dart';
import '../prpduct_reviews/product_reviews.dart';

class ProductDetail extends StatelessWidget {
  final Map<String, dynamic> productData;

  const ProductDetail({Key? key, required this.productData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("✅ Product Data Received: $productData"); // Debugging

    return Scaffold(
      appBar: AppBar(title: const Text("Product Details")),
      bottomNavigationBar: TBottomAddToCart(
        productPrice: double.tryParse(productData['price']?.toString() ?? '0') ?? 0.0,
        productName: productData['title'] ?? 'Product',
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🖼️ Product Image
            TProductImagesl(
              imageUrl: productData.containsKey('imageUrl') && productData['imageUrl'] != null
                  ? productData['imageUrl']
                  : TImages.productImageWB1, // Fallback image
            ),

            /// 🏷️ Product Title (Below Image)
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Text(
                productData['title'] ?? 'No Title Available',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            /// ⭐ Rating & Share
            const Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: TRatingAndShare(),
            ),

            /// 💰 Price & Stock
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: TProductMetaData(
                price: double.tryParse(productData['price']?.toString() ?? '0') ?? 0.0,
                stock: productData['stock'] ?? 'In Stock',
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections / 1.85),

            /// 🛒 Checkout button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => CartScreen()),
                  child: const Text('Checkout'),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// 📜 Description
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: TSectionHeading(title: 'Origins', showActionButton: false),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: ReadMoreText(
                productData['description'] ?? 'No description available.',
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Show more',
                trimExpandedText: ' Less',
                moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// 🔥 Significance
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: TSectionHeading(title: 'Significance', showActionButton: false),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: ReadMoreText(
                productData['significance'] ?? 'A timeless piece reflecting rich cultural heritage and historical significance, preserving the legacy of artistry and tradition for future generations.',
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Show more',
                trimExpandedText: ' Less',
                moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
            ),

            /// 💬 Reviews
            const SizedBox(height: TSizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TSectionHeading(title: 'Reviews (199)', showActionButton: false),
                  IconButton(
                    onPressed: () => Get.to(() => const ProductReview()),
                    icon: const Icon(Iconsax.arrow_right_3),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
