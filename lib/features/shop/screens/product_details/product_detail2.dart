import 'package:HeritageHub/features/shop/screens/product_details/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:HeritageHub/features/shop/screens/product_details/widgets/product_detail_image.dart';
import 'package:HeritageHub/utils/constants/image_strings.dart';

class TerracottaTemplePage extends StatelessWidget {
  const TerracottaTemplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Terracotta Heritage")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🖼️ Temple Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(TImages.heritage1, fit: BoxFit.cover),
              ),
              const SizedBox(height: 16),

              /// 🏛️ Temple & Craft Information
              const Text(
                "Bishnupur Terracotta Temple",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Bishnupur, West Bengal, is renowned for its intricate terracotta temples built by the Malla dynasty. These temples depict mythological tales and exquisite craftsmanship, making them a significant part of India's cultural heritage.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                "Terracotta Craft",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Terracotta art involves baked clay sculptures and pottery, preserving ancient traditions with stunning designs. It remains a thriving craft, deeply rooted in history.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

              /// 🔥 Recommended Terracotta Items
              const Text(
                "Recommended Items",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: 4, // Example count
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                TImages.productImageWB1,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Terracotta Sculpture",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
