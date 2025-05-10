import 'package:flutter/material.dart';
import 'package:HeritageHub/common/widgets/layout/grid_layout.dart';
import 'package:HeritageHub/common/widgets/products.cart/product_cards/product_card_vertical.dart';
import 'package:HeritageHub/common/widgets/texts/section_heading.dart';
import 'package:HeritageHub/utils/constants/sizes.dart';
import 'package:HeritageHub/utils/constants/image_strings.dart';

class TCategoryTab extends StatelessWidget {
  final String category;

  const TCategoryTab({
    super.key,
    required this.category,
  });

  // Example function to get product data based on the category
  List<Map<String, String>> getProductData() {
    switch (category) {
      case 'West Bengal':
        return [
          {'imageUrl': TImages.productImageWB1, 'title': 'Terracotta Art', 'price': '200', 'description': 'Clay craft', 'discount': '10%'},
          {'imageUrl': TImages.productImageWB2, 'title': 'Kantha Embroidery', 'price': '150', 'description': 'Hand stitch', 'discount': '15%'},
          {'imageUrl': TImages.productImageWB3, 'title': 'Dokra Metalwork', 'price': '250', 'description': 'Brass casting', 'discount': '12%'},
          {'imageUrl': TImages.productImageWB4, 'title': 'Shola Craft', 'price': '180', 'description': 'Softwood art', 'discount': '20%'},
          {'imageUrl': TImages.productImageWB5, 'title': 'Patachitra', 'price': '300', 'description': 'Scroll painting', 'discount': '18%'},
          {'imageUrl': TImages.productImageWB6, 'title': 'Baluchari Saree', 'price': '400', 'description': 'Silk weaving', 'discount': '25%'},
        ];
      case 'Andhra Pradesh':
        return [
          {'imageUrl': TImages.productImageAP1, 'title': 'Kalamkari', 'price': '250', 'description': 'Fabric painting', 'discount': '20%'},
          {'imageUrl': TImages.productImageAP2, 'title': 'Etikoppaka Toys', 'price': '180', 'description': 'Wood craft', 'discount': '25%'},
          {'imageUrl': TImages.productImageAP3, 'title': 'Leather Puppetry', 'price': '220', 'description': 'Shadow puppets', 'discount': '15%'},
          {'imageUrl': TImages.productImageAP4, 'title': 'Mangalagiri Saree', 'price': '350', 'description': 'Handloom cotton', 'discount': '10%'},
          {'imageUrl': TImages.productImageAP5, 'title': 'Bidriware', 'price': '270', 'description': 'Metal art', 'discount': '18%'},
          {'imageUrl': TImages.productImageAP6, 'title': 'Kondapalli Toys', 'price': '200', 'description': 'Handmade toys', 'discount': '12%'},
        ];
      case 'Rajasthan':
        return [
          {'imageUrl': TImages.productImageRJ1, 'title': 'Blue Pottery', 'price': '300', 'description': 'Glazed ceramic', 'discount': '30%'},
          {'imageUrl': TImages.productImageRJ2, 'title': 'Meenakari', 'price': '220', 'description': 'Metal enamel', 'discount': '35%'},
          {'imageUrl': TImages.productImageRJ3, 'title': 'Block Printing', 'price': '190', 'description': 'Textile art', 'discount': '20%'},
          {'imageUrl': TImages.productImageRJ4, 'title': 'Mojari Shoes', 'price': '180', 'description': 'Leather footwear', 'discount': '15%'},
          {'imageUrl': TImages.productImageRJ5, 'title': 'Pichwai Art', 'price': '280', 'description': 'Cloth painting', 'discount': '25%'},
          {'imageUrl': TImages.productImageRJ6, 'title': 'Kathputli Puppets', 'price': '160', 'description': 'Wood puppets', 'discount': '12%'},
        ];
      case 'Tamil Nadu':
        return [
          {'imageUrl': TImages.productImageTN1, 'title': 'Tanjore Art', 'price': '350', 'description': 'Gold painting', 'discount': '5%'},
          {'imageUrl': TImages.productImageTN2, 'title': 'Kanjeevaram Saree', 'price': '500', 'description': 'Silk weave', 'discount': '10%'},
          {'imageUrl': TImages.productImageTN3, 'title': 'Brass Lamps', 'price': '320', 'description': 'Metal craft', 'discount': '20%'},
          {'imageUrl': TImages.productImageTN4, 'title': 'Palm Manuscripts', 'price': '280', 'description': 'Leaf writing', 'discount': '15%'},
          {'imageUrl': TImages.productImageTN5, 'title': 'Tirunelveli Jewelry', 'price': '450', 'description': 'Hand jewelry', 'discount': '12%'},
          {'imageUrl': TImages.productImageTN6, 'title': 'Madurai Sungudi', 'price': '220', 'description': 'Tie-dye saree', 'discount': '18%'},
        ];
      case 'Gujarat':
        return [
          {'imageUrl': TImages.productImageGJ1, 'title': 'Bandhani', 'price': '120', 'description': 'Tie-dye fabric', 'discount': '15%'},
          {'imageUrl': TImages.productImageGJ2, 'title': 'Rogan Art', 'price': '170', 'description': 'Fabric paint', 'discount': '20%'},
          {'imageUrl': TImages.productImageGJ3, 'title': 'Patola Saree', 'price': '450', 'description': 'Ikat weave', 'discount': '10%'},
          {'imageUrl': TImages.productImageGJ4, 'title': 'Kutchi Art', 'price': '220', 'description': 'Mirror embroidery', 'discount': '18%'},
        ];
      case 'Uttar Pradesh':
        return [
          {'imageUrl': TImages.productImageUP1, 'title': 'Chikankari Embroidery', 'price': '250', 'description': 'Hand embroidery', 'discount': '15%'},
          {'imageUrl': TImages.productImageUP2, 'title': 'Banarasi Saree', 'price': '600', 'description': 'Silk weaving', 'discount': '10%'},
          {'imageUrl': TImages.productImageUP3, 'title': 'Brass Handicrafts', 'price': '350', 'description': 'Metalwork', 'discount': '12%'},
        ];
      case 'Madhya Pradesh':
        return [
          {'imageUrl': TImages.productImageMP1, 'title': 'Maheshwari Saree', 'price': '450', 'description': 'Handwoven cotton', 'discount': '20%'},
          {'imageUrl': TImages.productImageMP2, 'title': 'Bastar Iron Craft', 'price': '300', 'description': 'Tribal iron art', 'discount': '18%'},
        ];
      case 'Odisha':
        return [
          {'imageUrl': TImages.productImageOD1, 'title': 'Pattachitra', 'price': '230', 'description': 'Scroll art', 'discount': '20%'},
          {'imageUrl': TImages.productImageOD2, 'title': 'Dhokra Metal', 'price': '320', 'description': 'Tribal brass', 'discount': '25%'},
          {'imageUrl': TImages.productImageOD3, 'title': 'Applique Work', 'price': '260', 'description': 'Stitch art', 'discount': '15%'},
          {'imageUrl': TImages.productImageOD4, 'title': 'Silver Filigree', 'price': '350', 'description': 'Metal wire', 'discount': '10%'},
        ];
      case 'Assam':
        return [
          {'imageUrl': TImages.productImageAS1, 'title': 'Muga Silk', 'price': '500', 'description': 'Golden silk', 'discount': '10%'},
          {'imageUrl': TImages.productImageAS2, 'title': 'Bamboo Craft', 'price': '180', 'description': 'bamboo items', 'discount': '20%'},
          {'imageUrl': TImages.productImageAS3, 'title': 'Assamese Jewelry', 'price': '400', 'description': 'Traditional ornaments', 'discount': '15%'},
        ];
      default:
        return [];
    }
  }



  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> products = getProductData();

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TSectionHeading(
                title: '$category Stamps for You',
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TGridLayout(
                itemCount: products.length,
                itemBuilder: (_, index) {
                  final product = products[index];
                  return TProductCardVertical(
                    imageUrl: product['imageUrl']!,
                    title: product['title']!,
                    price: product['price']!,
                    description: product['description']!,
                    discount: product['discount']!,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
