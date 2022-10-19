import 'package:flutter/material.dart';

class ItemModel {
  final String title;
  final String subtitle;
  final String icon;
  final Color color;
  final String route;

  ItemModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.route,
  });
}
