import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:flutter/material.dart';

class CardDrugPharmacy extends StatelessWidget {
  const CardDrugPharmacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 2, 10, 5),
        width: MediaQuery.of(context).size.width,
        height: 80,
        decoration: BoxDecoration(color: Colors.grey.shade100.withOpacity(0.5)),
        child: Row(
          children: [
            Container(
              width: 10,
              height: 80,
              decoration: BoxDecoration(color: context.primaryColor),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/wallmart.png',
                  height: 50,
                  fit: BoxFit.cover,
                ),
                const Text(
                  '1.81 miles',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                )
              ],
            ),
            const SizedBox(
              width: 80,
            ),
          ],
        ),
      ),
    );
  }
}
