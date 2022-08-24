import 'package:discount_card_app/app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomAppBarWithFilter extends AppBar {
  CustomAppBarWithFilter({Key? key})
      : super(
            key: key,
            elevation: 0,
            toolbarHeight: 180,
            backgroundColor: Colors.white,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/logo-client-crx.png',
                  fit: BoxFit.cover,
                  height: 80,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  hint: 'Drug Name',
                  showIcon: true,
                  icon: Icons.search,
                ),
              ],
            ));
}
