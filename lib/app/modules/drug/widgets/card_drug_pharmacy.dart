import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CardDrugPharmacy extends StatelessWidget {
  final String name;
  final double distance;
  final double price;

  const CardDrugPharmacy(
      {Key? key,
      required this.name,
      required this.distance,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed('/drug/details'),
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
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name.toString(),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    '${distance.toStringAsFixed(2)} miles',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('\$$price',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff04461F),
                      )),
                  const Text('\$5.0 Bonus Saving',
                      style:
                          TextStyle(fontSize: 9, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            const Spacer(),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
