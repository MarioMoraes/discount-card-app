import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({Key? key})
      : super(
            key: key,
            elevation: 0,
            toolbarHeight: 100,
            backgroundColor: Colors.white,
            centerTitle: true,
            automaticallyImplyLeading: true,
            title: Image.asset(
              'assets/images/logo-client-crx.png',
              fit: BoxFit.cover,
              height: 80,
            ));
}
