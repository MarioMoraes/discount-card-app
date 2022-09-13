import 'package:discount_card_app/app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomAppBarWithFilter extends AppBar {
  final String msg;
  final String textSearch;

  CustomAppBarWithFilter(
      {Key? key, required this.msg, required this.textSearch})
      : super(
          key: key,
          elevation: 0,
          toolbarHeight: 180,
          backgroundColor: Colors.white,
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: SizedBox(
            height: 180,
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  msg,
                  style: const TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  hint: textSearch,
                  showIcon: true,
                  icon: Icons.search,
                ),
              ],
            ),
          ),
        );
}
