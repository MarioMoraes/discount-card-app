import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:discount_card_app/app/models/drug_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CardSearchDrug extends StatelessWidget {
  final DrugModel model;

  const CardSearchDrug({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Modular.to.pushNamed('/drug/pharmacies-list', arguments: model),
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 2, 10, 5),
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(color: Colors.grey.shade100.withOpacity(0.5)),
        child: Row(
          children: [
            Container(
              width: 10,
              height: 60,
              decoration: BoxDecoration(color: context.primaryColor),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .75,
                    child: Text(
                      model.name ?? '',
                      style: const TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    model.dosage ?? '',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .85,
                    child: Text(
                      model.coverage ?? '',
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
