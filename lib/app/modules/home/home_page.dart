import 'package:discount_card_app/app/core/widgets/custom_app_bar.dart';
import 'package:discount_card_app/app/modules/home/widgets/card_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          CardHome(
            label: 'Drug Search',
            description: 'Search RxDrugs and Get Discount',
            icon: 'assets/images/meds.png',
            onPress: () => _goToDrug('/drug'),
          ),
          CardHome(
            label: 'Pharmacies List',
            description: 'Find Near Pharmacies',
            icon: 'assets/images/pharmacy.png',
            onPress: () => _goToDrug('/pharmacy'),
          ),
          CardHome(
            label: 'Discount Card',
            description: '',
            icon: 'assets/images/id-card.png',
            onPress: () => _goToDrug('/drug'),
          ),
        ],
      ),
    );
  }

  _goToDrug(String page) {
    Modular.to.pushNamed(page);
  }
}
