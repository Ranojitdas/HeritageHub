import 'package:flutter/material.dart';
import 'package:HeritageHub/common/widgets/appbar/appbar.dart';
import 'package:HeritageHub/features/shop/screens/order/widgets/order_list.dart';
import 'package:HeritageHub/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///Appbar
      appBar: TAppbar(
        title: Text('My Orders',style: Theme.of(context).textTheme.headlineSmall,),showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),


        /// Orders
        child: TOrderList(),
      ),
    );
  }
}
