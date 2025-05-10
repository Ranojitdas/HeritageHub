import 'dart:ui';

import 'package:HeritageHub/common/widgets/images_banner/t_rounded_banner_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../product_details/product_detail2.dart';

class places_card extends StatelessWidget {
  final String title;
  final String image;
  final String subtitle;
  const places_card({
    super.key,required this.title, required this.image, required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => TerracottaTemplePage());
      },
      child: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    TRoundedImage(imageUrl: image),
                    const SizedBox(height: 12,),
                    Text(title,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    const SizedBox(height:8),
                    Text(subtitle,style: const TextStyle(fontSize: 20,),),
                    const SizedBox(height: 12,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
