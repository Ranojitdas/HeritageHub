import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:HeritageHub/features/shop/screens/Home/widgets/home_appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/images_banner/t_rounded_banner_image.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/products.cart/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../authentication/controllers.onboarding/signup/signup_controller.dart';
import '../all_products/all_products.cart.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> productData = [
    {
      'imageUrl': TImages.productImageAP1,
      'title': 'Kalamkari Artwork',
      'price': '1200',
      'description': 'Handcrafted arts',
      'discount': '15',
      'category': 'Andhra Pradesh Handicrafts',
    },
    {
      'imageUrl': TImages.productImageRJ2,
      'title': 'Meenakari Jewelry',
      'price': '2500',
      'description': 'Traditional craft',
      'discount': '10',
      'category': 'Rajasthan Handicrafts',
    },
    {
      'imageUrl': TImages.productImageWB1,
      'title': 'Terracotta Sculpture',
      'price': '1800',
      'description': 'Clay artwork',
      'discount': '12',
      'category': 'West Bengal Handicrafts',
    },
    {
      'imageUrl': TImages.productImageOD1,
      'title': 'Pattachitra Painting',
      'price': '3000',
      'description': 'Folk art',
      'discount': '20',
      'category': 'Odisha Handicrafts',
    },
    {
      'imageUrl': TImages.productImageWB2,
      'title': 'Bandhani Fabric',
      'price': '1500',
      'description': 'Tie-dye textile',
      'discount': '18',
      'category': 'Gujarat Handicrafts',
    },
    {
      'imageUrl': TImages.productImageWB2,
      'title': 'Brassware Decor',
      'price': '2200',
      'description': 'Metal craft',
      'discount': '15',
      'category': 'Uttar Pradesh Handicrafts',
    },
    {
      'imageUrl': TImages.productImageWB2,
      'title': 'Gond Painting',
      'price': '2700',
      'description': 'Tribal art',
      'discount': '10',
      'category': 'Madhya Pradesh Handicrafts',
    },
    {
      'imageUrl': TImages.productImageWB6,
      'title': 'Muga Silk Saree',
      'price': '5000',
      'description': 'Assamese silk',
      'discount': '12',
      'category': 'Assam Handicrafts',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final signupController = Get.put(SignupController());

    return Scaffold(
      body: Obx(() {
        // Filter products based on selected preferences
        final selectedPreferences = signupController.selectedPreferences;
        final filteredProductData = selectedPreferences.isEmpty
            ? productData
            : productData
            .where((product) =>
            selectedPreferences.contains(product['category']))
            .toList();

// Dynamic title and default to a generic title if no preferences
        final sectionTitle = selectedPreferences.isEmpty
            ? 'Textiles - Chikankari'
            : 'Your Preferences: ${selectedPreferences.join(", ")}';


        return SingleChildScrollView(
          child: Column(
            children: [
              const TPrimaryHeaderContainer(
                child: Column(
                  children: [
                    THomeAppBar(),
                    SizedBox(height: TSizes.spaceBtwSections),
                    TSearchContainer(text: 'Find Your Art & Craft'),
                    SizedBox(height: TSizes.spaceBtwSections),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    const TRoundedImage(imageUrl: TImages.banner1),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    TSectionHeading(
                      title: sectionTitle,
                      onPressed: () => Get.to(() => const AllProducts()),
                    ),
                    TGridLayout(
                      itemCount: filteredProductData.length,
                      itemBuilder: (_, index) {
                        final product = filteredProductData[index];
                        return TProductCardVertical(
                          imageUrl: product['imageUrl'] ?? TImages.productImage5,
                          title: product['title'] ?? 'Unknown Product',
                          price: product['price'] ?? '0',
                          description: product['description'] ??
                              'No description available',
                          discount: product['discount'] ?? '0',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
