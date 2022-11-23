import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:discount_card_app/app/models/pharmacy_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CardPharmacy extends StatelessWidget {
  final PharmacyLocation model;

  const CardPharmacy({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed('/pharmacy/detail', arguments: model),
      child: Container(
        margin: const EdgeInsets.fromLTRB(2, 2, 4, 5),
        width: MediaQuery.of(context).size.width,
        height: 80,
        decoration: BoxDecoration(color: Colors.grey.shade200.withOpacity(0.6)),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .70,
                  child: Text(
                    model.pharmacy.name.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade900,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Text(
                    model.pharmacy.address,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${model.pharmacy.distance.toStringAsFixed(2)} miles',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 20,
              color: Colors.grey.shade500,
            )
          ],
        ),
      ),
    );
  }
}
