import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:HeritageHub/features/personalization/screens/settings/settings.dart';
import 'package:HeritageHub/features/shop/screens/Home/home.dart';
import 'package:HeritageHub/features/shop/screens/store/store.dart';
import 'package:HeritageHub/utils/constants/colors.dart';
import 'package:HeritageHub/utils/helpers/helper_functions.dart';
import 'features/shop/screens/Historic_sites/historic_site.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index ,
          backgroundColor: darkMode ? TColors.black : Colors.white,
          indicatorColor: darkMode ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
        
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Crafts'),
            NavigationDestination(icon: Icon(Iconsax.courthouse), label: 'Heritage Sites'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
        ],
        
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens = [ HomeScreen(), StoreScreen() , const HistoricScreen(),const SettingScreen()];
}