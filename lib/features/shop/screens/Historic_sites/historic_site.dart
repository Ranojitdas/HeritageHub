import 'dart:ui';

import 'package:HeritageHub/features/shop/screens/Historic_sites/widgets/places_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:HeritageHub/common/widgets/appbar/appbar.dart';
import 'package:HeritageHub/common/widgets/icons/t_circular_icon.dart';
import 'package:HeritageHub/common/widgets/layout/grid_layout.dart';
import 'package:HeritageHub/common/widgets/products.cart/product_cards/product_card_vertical.dart';
import 'package:HeritageHub/features/shop/screens/Home/home.dart';
import 'package:HeritageHub/utils/constants/image_strings.dart';
import 'package:HeritageHub/utils/constants/sizes.dart';

import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class HistoricScreen extends StatelessWidget {
  const HistoricScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(
        title: Text(
          'Places to visit',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // Header Section (Replaces SliverAppBar)
          children: [
            Container(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            color: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
            width: double.infinity,
            height: 120,  // Expanded height
            child: const TSearchContainer(
              text: 'Explore Historical Places',
              showBorder: true,
              showBackground: false,
              padding: EdgeInsets.zero,
            ),
          ),
            const Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  places_card(title:'West Begal',image: TImages.heritage1,subtitle:'Bishnupur terracotta temple'),
                  SizedBox(height: 10,),
                  places_card(title: 'Andhra Pradesh', image: TImages.heritage2, subtitle:'Srikalahasti temple',),
                  SizedBox(height: 10,),
                  places_card(title: 'Rajasthan', image: TImages.heritage3, subtitle: 'Jaipur Hawa Mahal',),
                  SizedBox(height: 10,),
                  places_card(title: 'Tamil nadu', image: TImages.heritage4, subtitle: 'Thanjavur Brihadeeswarar Temple',),
                  places_card(title:'Gujarat', image: TImages.heritage5, subtitle: 'Vadodara Fort',),
                  SizedBox(height: 10,),
                  places_card(title: 'Uttar Pradesh', image: TImages.heritage6, subtitle: 'Varanasi Ghats',),
                  SizedBox(height: 10,),
                  places_card(title: 'Madhya Pradesh', image: TImages.heritage7, subtitle: 'Maheshwar fort',),
                  SizedBox(height: 10,),
                  places_card(title: 'Odisha', image: TImages.heritage8, subtitle: 'Jagannath temple',),
                  SizedBox(height: 10,),
                  places_card(title: 'Assam', image: TImages.heritage9, subtitle: 'Sivasagar (Ahom kingdom)',),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



