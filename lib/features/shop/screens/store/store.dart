import 'package:flutter/material.dart';
import 'package:HeritageHub/common/widgets/appbar/TabBar.dart';
import 'package:HeritageHub/common/widgets/appbar/appbar.dart';
import 'package:HeritageHub/common/widgets/appbar/category_tab.dart';
import 'package:HeritageHub/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:HeritageHub/common/widgets/products.cart/cart_menu_icon.dart';
import 'package:HeritageHub/utils/constants/colors.dart';
import 'package:HeritageHub/utils/constants/sizes.dart';
import 'package:HeritageHub/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9, // Number of tabs
      child: Scaffold(
        appBar: TAppbar(
          title: Text(
            'Collections',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(onPressed: () {}),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor:
                THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
                expandedHeight: 180,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: const [
                      SizedBox(height: TSizes.spaceBtwItems),
                      TSearchContainer(
                        text: 'Explore Crafts',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ),
                bottom: const TTabBar(
                  tabs: [
                    Tab(child: Text('West Bengal')),
                    Tab(child: Text('Andhra Pradesh')),
                    Tab(child: Text('Rajasthan')),
                    Tab(child: Text('Tamil Nadu')),
                    Tab(child: Text('Gujarat')),
                    Tab(child: Text('Uttar Pradesh')),
                    Tab(child: Text('Madhya Pradesh')),
                    Tab(child: Text('Odisha')),
                    Tab(child: Text('Assam')),
                  ],

                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              TCategoryTab(category: 'West Bengal'),
              TCategoryTab(category: 'Andhra Pradesh'),
              TCategoryTab(category: 'Rajasthan'),
              TCategoryTab(category: 'Tamil Nadu'),
              TCategoryTab(category: 'Gujarat'),
              TCategoryTab(category: 'Uttar Pradesh'),
              TCategoryTab(category: 'Madhya Pradesh'),
              TCategoryTab(category: 'Odisha'),
              TCategoryTab(category: 'Assam'),

            ],
          ),
        ),
      ),
    );
  }
}
