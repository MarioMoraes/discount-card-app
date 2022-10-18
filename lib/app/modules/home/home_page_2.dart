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
              children: [
                logo(),
                title(context),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget logo() {
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

  Widget title(context) {
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
