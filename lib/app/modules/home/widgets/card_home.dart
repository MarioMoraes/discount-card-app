import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  final String label;
  final String description;
  final String icon;
  final VoidCallback onPress;

  const CardHome(
      {Key? key,
      required this.label,
      required this.description,
      required this.icon,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(color: Colors.grey.shade200),
        child: ListTile(
          title: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 17,
            ),
          ),
          subtitle: Text(
            description,
            style: const TextStyle(fontSize: 12),
          ),
          leading: Image.asset(
            icon,
            fit: BoxFit.cover,
            height: 30,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 15,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
