// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class ItemModel {
  String title;
  String subtitle;
  String icon;
  Color color;

  ItemModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'icon': icon,
      'color': color.value,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      icon: map['icon'] as String,
      color: Color(map['color'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
