import 'package:flutter/material.dart';
import 'package:HeritageHub/utils/constants/sizes.dart';

class TBillingAmount2 extends StatefulWidget {
  final Function(double) updateTotal;  // Callback function

  const TBillingAmount2({super.key, required this.updateTotal});

  @override
  _TBillingAmount2State createState() => _TBillingAmount2State();
}

class _TBillingAmount2State extends State<TBillingAmount2> {
  final TextEditingController _amountController = TextEditingController();
  double orderTotal = 0.0;

  void _updateTotal() {
    setState(() {
      orderTotal = double.tryParse(_amountController.text) ?? 0.0;
    });
    widget.updateTotal(orderTotal);  // Notify the parent about the change
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// SubTotal with TextField
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(
              width: 100,
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter Amount',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => _updateTotal(),
              ),
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        /// Tax fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('0.0 ₹', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('$orderTotal ₹', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
