import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:HeritageHub/common/widgets/appbar/appbar.dart';
import 'package:HeritageHub/common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import 'package:HeritageHub/common/widgets/icons/t_circular_icon.dart';
import 'package:HeritageHub/utils/constants/colors.dart';
import 'package:HeritageHub/utils/constants/sizes.dart';
import 'package:HeritageHub/utils/helpers/helper_functions.dart';

class TProductImagesl extends StatelessWidget {
  final String imageUrl;

  const TProductImagesl({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final bool isNetworkImage = imageUrl.startsWith('http') || imageUrl.startsWith('https');

    print("✅ Loading Image: $imageUrl"); // Debugging

    return TCurvedWidgets(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            /// Large Product Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: isNetworkImage
                      ? Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      print(" Network Image failed to load: $error");
                      return const Icon(Icons.broken_image, size: 100, color: Colors.grey);
                    },
                  )
                      : Image.asset(
                    imageUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      print(" Asset Image failed to load: $error");
                      return const Icon(Icons.broken_image, size: 100, color: Colors.grey);
                    },
                  ),
                ),
              ),
            ),

            /// Appbar icons (Back & Favorite)
            const TAppbar(
              actions: [
                TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
