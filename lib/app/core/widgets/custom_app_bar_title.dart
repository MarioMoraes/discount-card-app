import 'package:flutter/material.dart';

class CustomAppBarTitle extends AppBar {
  final String msg;
  final String subtitle;

  CustomAppBarTitle({Key? key, required this.msg, required this.subtitle})
      : super(
          key: key,
          elevation: 0,
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                msg,
                style: const TextStyle(fontSize: 25),
              ),
              Text(
                subtitle,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        );
}
