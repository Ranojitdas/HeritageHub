import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:HeritageHub/common/widgets/appbar/appbar.dart';
import 'package:HeritageHub/common/widgets/layout/grid_layout.dart';
import 'package:HeritageHub/common/widgets/products.cart/product_cards/product_card_vertical.dart';
import 'package:HeritageHub/utils/constants/image_strings.dart';
import 'package:HeritageHub/utils/constants/sizes.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  String selectedState = 'West Bengal';

  final Map<String, List<Map<String, String>>> stateProducts = {
    'West Bengal': [
      {
        'imageUrl': TImages.productImageWB1,
        'title': 'Terracotta Art',
        'price': '200',
        'description': 'Clay craft',
        'discount': '10%'
      },
      {
        'imageUrl': TImages.productImageWB2,
        'title': 'Kantha Embroidery',
        'price': '150',
        'description': 'Hand stitch',
        'discount': '15%'
      },
      {
        'imageUrl': TImages.productImageWB3,
        'title': 'Dokra Metalwork',
        'price': '250',
        'description': 'Brass casting',
        'discount': '12%'
      },
      {
        'imageUrl': TImages.productImageWB4,
        'title': 'Shola Craft',
        'price': '180',
        'description': 'Softwood art',
        'discount': '20%'
      },
    ],
    'Andhra Pradesh': [
      {
        'imageUrl': TImages.productImageAP1,
        'title': 'Kalamkari',
        'price': '250',
        'description': 'Fabric painting',
        'discount': '20%'
      },
      {
        'imageUrl': TImages.productImageAP2,
        'title': 'Etikoppaka Toys',
        'price': '180',
        'description': 'Wood craft',
        'discount': '25%'
      },
      {
        'imageUrl': TImages.productImageAP3,
        'title': 'Leather Puppetry',
        'price': '220',
        'description': 'Shadow puppets',
        'discount': '15%'
      },
      {
        'imageUrl': TImages.productImageAP4,
        'title': 'Mangalagiri Saree',
        'price': '350',
        'description': 'Handloom cotton',
        'discount': '10%'
      },
    ],
    'Rajasthan': [
      {
        'imageUrl': TImages.productImageRJ1,
        'title': 'Blue Pottery',
        'price': '300',
        'description': 'Glazed ceramic',
        'discount': '30%'
      },
      {
        'imageUrl': TImages.productImageRJ2,
        'title': 'Meenakari',
        'price': '220',
        'description': 'Metal enamel',
        'discount': '35%'
      },
      {
        'imageUrl': TImages.productImageRJ3,
        'title': 'Block Printing',
        'price': '190',
        'description': 'Textile art',
        'discount': '20%'
      },
      {
        'imageUrl': TImages.productImageRJ4,
        'title': 'Mojari Shoes',
        'price': '180',
        'description': 'Leather footwear',
        'discount': '15%'
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppbar(
        title: Text('Popular Handicrafts'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Dropdown for State Selection
              DropdownButtonFormField(
                decoration:
                    const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                value: selectedState,
                onChanged: (value) {
                  setState(() {
                    selectedState = value.toString();
                  });
                },
                items: stateProducts.keys
                    .map((state) => DropdownMenuItem(
                          value: state,
                          child: Text(state),
                        ))
                    .toList(),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Product Grid
              TGridLayout(
                itemCount: stateProducts[selectedState]?.length ?? 0,
                itemBuilder: (_, index) {
                  final product = stateProducts[selectedState]![index];
                  return TProductCardVertical(
                    imageUrl: product['imageUrl']!,
                    title: product['title']!,
                    price: '\$${product['price']}',
                    description: product['description']!,
                    discount: '${product['discount']} off',
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
