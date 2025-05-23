import 'package:flutter/material.dart';
import 'package:HeritageHub/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:HeritageHub/utils/constants/colors.dart';
import 'package:HeritageHub/utils/constants/sizes.dart';
import 'package:HeritageHub/utils/helpers/helper_functions.dart';


class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(top: TSizes.sm, bottom: TSizes.sm,right: TSizes.sm,left: TSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a Promo Code ? Enter here',
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// Button
          SizedBox(width: 80,child: ElevatedButton(onPressed: (){}, child: const Text('Apply'),style: ElevatedButton.styleFrom(
            foregroundColor: dark ? TColors.white.withOpacity(0.5) : TColors.dark.withOpacity(0.5),
            backgroundColor: Colors.grey.withOpacity(0.2),
            side: BorderSide(color: Colors.grey.withOpacity(0.1)),
          ),
          ),
          ),
        ],
      ),

    );
  }
}
