import 'package:discount_card_app/app/core/ui/theme_extension.dart';
import 'package:flutter/material.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          delegate: SliverChildListDelegate(
            [
              const _ItemChoice(),
              const _ItemChoice(),
              const _ItemChoice(),
            ],
          ),
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
      padding: const EdgeInsets.only(top: 50),
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
          top: 50, left: MediaQuery.of(context).size.width * .15),
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
  const _ItemChoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green.shade100,
        ),
        child: ListTile(
          title: const Text('Search Drugs'),
          subtitle: const Text('Search Rx Drugs and Get Discount'),
          trailing: Image.asset('assets/images/meds.png', width: 25),
        ),
      ),
    );
  }
}
