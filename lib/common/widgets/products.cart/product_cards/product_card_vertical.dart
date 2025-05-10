import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/screens/product_details/product_details.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/shadows.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/t_circular_icon.dart';
import '../../images_banner/t_rounded_banner_image.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class TProductCardVertical extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String description;
  final String discount;

  const TProductCardVertical({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.description,
    required this.discount,
  });

  // Example function to get product data based on the category
  Map<String, String> getProductData(String title) {
    switch (title) {
      case 'Terracotta Art':
        return {
          'title': 'Terracotta Art',
          'price': '200',
          'description': 'Clay craft',
          'discount': '10%',
          'imageUrl': TImages.productImageWB1
        };

      case 'Kantha Embroidery':
        return {
          'title': 'Kantha Embroidery',
          'price': '150',
          'description': 'Hand stitch',
          'discount': '15%',
          'imageUrl': TImages.productImageWB2
        };

      case 'Dokra Metalwork':
        return {
          'title': 'Dokra Metalwork',
          'price': '250',
          'description': 'Brass casting',
          'discount': '12%',
          'imageUrl': TImages.productImageWB3
        };

      case 'Shola Craft':
        return {
          'title': 'Shola Craft',
          'price': '180',
          'description': 'Softwood art',
          'discount': '20%',
          'imageUrl': TImages.productImageWB4
        };

      case 'Patachitra':
        return {
          'title': 'Patachitra',
          'price': '300',
          'description': 'Scroll painting',
          'discount': '18%',
          'imageUrl': TImages.productImageWB5
        };

      case 'Baluchari Saree':
        return {
          'title': 'Baluchari Saree',
          'price': '400',
          'description': 'Silk weaving',
          'discount': '25%',
          'imageUrl': TImages.productImageWB6
        };

      case 'Kalamkari':
        return {
          'title': 'Kalamkari',
          'price': '250',
          'description': 'Fabric painting',
          'discount': '20%',
          'imageUrl': TImages.productImageAP1
        };

      case 'Etikoppaka Toys':
        return {
          'title': 'Etikoppaka Toys',
          'price': '180',
          'description': 'Wood craft',
          'discount': '25%',
          'imageUrl': TImages.productImageAP2
        };

      case 'Leather Puppetry':
        return {
          'title': 'Leather Puppetry',
          'price': '220',
          'description': 'Shadow puppets',
          'discount': '15%',
          'imageUrl': TImages.productImageAP3
        };

      case 'Mangalagiri Saree':
        return {
          'title': 'Mangalagiri Saree',
          'price': '350',
          'description': 'Handloom cotton',
          'discount': '10%',
          'imageUrl': TImages.productImageAP4
        };

      case 'Bidriware':
        return {
          'title': 'Bidriware',
          'price': '270',
          'description': 'Metal art',
          'discount': '18%',
          'imageUrl': TImages.productImageAP5
        };

      case 'Kondapalli Toys':
        return {
          'title': 'Kondapalli Toys',
          'price': '200',
          'description': 'Handmade toys',
          'discount': '12%',
          'imageUrl': TImages.productImageAP6
        };

      case 'Blue Pottery':
        return {
          'title': 'Blue Pottery',
          'price': '300',
          'description': 'Glazed ceramic',
          'discount': '30%',
          'imageUrl': TImages.productImageRJ1
        };

      case 'Meenakari':
        return {
          'title': 'Meenakari',
          'price': '220',
          'description': 'Metal enamel',
          'discount': '35%',
          'imageUrl': TImages.productImageRJ2
        };

      case 'Block Printing':
        return {
          'title': 'Block Printing',
          'price': '190',
          'description': 'Textile art',
          'discount': '20%',
          'imageUrl': TImages.productImageRJ3
        };

      case 'Mojari Shoes':
        return {
          'title': 'Mojari Shoes',
          'price': '180',
          'description': 'Leather footwear',
          'discount': '15%',
          'imageUrl': TImages.productImageRJ4
        };

      case 'Pichwai Art':
        return {
          'title': 'Pichwai Art',
          'price': '280',
          'description': 'Cloth painting',
          'discount': '25%',
          'imageUrl': TImages.productImageRJ5
        };

      case 'Kathputli Puppets':
        return {
          'title': 'Kathputli Puppets',
          'price': '160',
          'description': 'Wood puppets',
          'discount': '12%',
          'imageUrl': TImages.productImageRJ6
        };

      case 'Tanjore Art':
        return {
          'title': 'Tanjore Art',
          'price': '350',
          'description': 'Gold painting',
          'discount': '5%',
          'imageUrl': TImages.productImageTN1
        };

      case 'Kanjeevaram Saree':
        return {
          'title': 'Kanjeevaram Saree',
          'price': '500',
          'description': 'Silk weave',
          'discount': '10%',
          'imageUrl': TImages.productImageTN2
        };

      case 'Brass Lamps':
        return {
          'title': 'Brass Lamps',
          'price': '320',
          'description': 'Metal craft',
          'discount': '20%',
          'imageUrl': TImages.productImageTN3
        };

      case 'Palm Manuscripts':
        return {
          'title': 'Palm Manuscripts',
          'price': '280',
          'description': 'Leaf writing',
          'discount': '15%',
          'imageUrl': TImages.productImageTN4
        };

      case 'Tirunelveli Jewelry':
        return {
          'title': 'Tirunelveli Jewelry',
          'price': '450',
          'description': 'Hand jewelry',
          'discount': '12%',
          'imageUrl': TImages.productImageTN5
        };

      case 'Madurai Sungudi':
        return {
          'title': 'Madurai Sungudi',
          'price': '220',
          'description': 'Tie-dye saree',
          'discount': '18%',
          'imageUrl': TImages.productImageTN6
        };

      case 'Bandhani':
        return {
          'title': 'Bandhani',
          'price': '120',
          'description': 'Tie-dye fabric',
          'discount': '15%',
          'imageUrl': TImages.productImageGJ1
        };

      case 'Rogan Art':
        return {
          'title': 'Rogan Art',
          'price': '170',
          'description': 'Fabric paint',
          'discount': '20%',
          'imageUrl': TImages.productImageGJ2
        };

      case 'Patola Saree':
        return {
          'title': 'Patola Saree',
          'price': '450',
          'description': 'Ikat weave',
          'discount': '10%',
          'imageUrl': TImages.productImageGJ3
        };

      case 'Kutchi Art':
        return {
          'title': 'Kutchi Art',
          'price': '220',
          'description': 'Mirror embroidery',
          'discount': '18%',
          'imageUrl': TImages.productImageGJ4
        };

      case 'Chikankari Embroidery':
        return {
          'title': 'Chikankari Embroidery',
          'price': '250',
          'description': 'Hand embroidery',
          'discount': '15%',
          'imageUrl': TImages.productImageUP1
        };

      case 'Banarasi Saree':
        return {
          'title': 'Banarasi Saree',
          'price': '600',
          'description': 'Silk weaving',
          'discount': '10%',
          'imageUrl': TImages.productImageUP2
        };

      case 'Brass Handicrafts':
        return {
          'title': 'Brass Handicrafts',
          'price': '350',
          'description': 'Metalwork',
          'discount': '12%',
          'imageUrl': TImages.productImageUP3
        };

      case 'Maheshwari Saree':
        return {
          'title': 'Maheshwari Saree',
          'price': '450',
          'description': 'Handwoven cotton',
          'discount': '20%',
          'imageUrl': TImages.productImageMP1
        };
      case 'Muga Silk':
        return {
          'title': 'Maheshwari Saree',
          'price': '450',
          'description': 'Handwoven cotton',
          'discount': '20%',
          'imageUrl': TImages.productImageAS1
        };
      case 'Maheshwari Saree':
        return {
          'title': 'Maheshwari Saree',
          'price': '450',
          'description': 'Handwoven cotton',
          'discount': '20%',
          'imageUrl': TImages.productImageMP1
        };
      case 'Maheshwari Saree':
        return {
          'title': 'Maheshwari Saree',
          'price': '450',
          'description': 'Handwoven cotton',
          'discount': '20%',
          'imageUrl': TImages.productImageMP1
        };
      case 'Maheshwari Saree':
        return {
          'title': 'Maheshwari Saree',
          'price': '450',
          'description': 'Handwoven cotton',
          'discount': '20%',
          'imageUrl': TImages.productImageMP1
        };

      case 'Bastar Iron Craft':
        return {
          'title': 'Bastar Iron Craft',
          'price': '300',
          'description': 'Tribal iron art',
          'discount': '18%',
          'imageUrl': TImages.productImageMP2
        };

      case 'Bamboo Craft':
        return {
          'title': 'Bamboo Craft',
          'price': '180',
          'description': 'Bamboo items',
          'discount': '20%',
          'imageUrl': TImages.productImageAS2
        };

      case 'Assamese Jewelry':
        return {
          'title': 'Assamese Jewelry',
          'price': '400',
          'description': 'Traditional ornaments',
          'discount': '15%',
          'imageUrl': TImages.productImageAS3
        };

      default:
        return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        Map<String, String> selectedProduct = getProductData(title);
        print('Selected Product Data: $selectedProduct'); // Debugging
        if (selectedProduct.isNotEmpty) {
          Get.to(() => ProductDetail(productData: selectedProduct));
        } else {
          print('Error: Product data is empty!');
        }
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
            // Thumbnail, wishlist, and discount
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  // Thumbnail Image
                  TRoundedImage(
                    imageUrl: imageUrl, // Use the passed image URL here
                    applyImageRadius: true,
                    fit: BoxFit.cover,
                  ),

                  // Sale tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '$discount', // Use the discount value passed in the constructor
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),

                  // Favourite icon
                  const Positioned(
                    top: 0,
                    right: 0,
                    child:
                        TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            // Details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(
                      title: title,
                      smallSize:
                          true), // Use the title passed in the constructor
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      Text(
                        description, // Use the description passed in the constructor
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(width: TSizes.xs),
                      const Icon(
                        Iconsax.verify5,
                        color: TColors.primary,
                        size: TSizes.iconXs,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: TProductPriceText(
                      price: price), // Using the passed price value
                ),

                // Add to Cart
                Container(
                  decoration: const BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                    width: TSizes.iconLg * 1.2,
                    height: TSizes.iconLg * 1.2,
                    child:
                        Center(child: Icon(Iconsax.add, color: TColors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
