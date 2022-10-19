import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:discount_card_app/app/models/item_model.dart';
import 'package:flutter/material.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = <ItemModel>[
      ItemModel(
        title: 'Drug Search',
        subtitle: 'Search Rx Drugs and Get Discount',
        icon: 'assets/images/meds.png',
        color: const Color(0xffc7d8a7),
      ),
      ItemModel(
        title: 'Pharmacies List',
        subtitle: 'Find Near Pharmacies',
        icon: 'assets/images/pharmacy.png',
        color: const Color(0xffbbd095),
      ),
      ItemModel(
          title: 'Discount Card',
          subtitle: 'Get Your Discount Card',
          icon: 'assets/images/id-card.png',
          color: const Color(0xffb0c884)),
    ];

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.primaryColor,
                  context.primaryColorLight,
                ],
              ),
              color: context.primaryColor,
            ),
            child: Column(
              children: const [
                _Logo(),
                _Title(),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(items
              .map(
                (e) => _ItemChoice(
                    title: e.title,
                    subtitle: e.subtitle,
                    icon: e.icon,
                    color: e.color),
              )
              .toList()),
        ),
      ],
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .15),
      child: Center(
        child: Image.asset(
          'assets/images/logo_citizensrx_0.5x.png',
          height: 90,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 50, left: MediaQuery.of(context).size.width * .20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const Text(
          'Prescription Drug\n  Discount Cards',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _ItemChoice extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  final Color color;

  const _ItemChoice({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          color: color,
        ),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 16),
          ),
          trailing: Image.asset(icon, width: 25),
        ),
      ),
    );
  }
}
