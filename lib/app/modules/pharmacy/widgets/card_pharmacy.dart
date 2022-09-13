import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CardPharmacy extends StatelessWidget {
  const CardPharmacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed('/pharmacy/detail'),
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
                  'assets/images/wal.png',
                  height: 35,
                  width: 85,
                  fit: BoxFit.cover,
                ),
                const Text(
                  '1129 Lake ST - OAK PARK',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '1.81 miles',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                )
              ],
            ),
            const SizedBox(
              width: 105,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.location_on,
                    size: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
