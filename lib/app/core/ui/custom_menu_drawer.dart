import 'package:flutter/material.dart';

class CustomMenuDrawer extends Drawer {
  CustomMenuDrawer({Key? key})
      : super(
          key: key,
          backgroundColor: const Color(0xffdde8ca),
          child: Column(
            children: const [
              FlutterLogo(),
            ],
          ),
        );
}
