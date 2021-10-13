import 'package:flutter/material.dart';

class AppBarCustomButton extends StatelessWidget {
  const AppBarCustomButton({
    Key? key,
    @required this.icon,
    @required this.color,
    @required this.iconColor,
    @required this.margin,
  }) : super(key: key);

  final IconData? icon;
  final Color? color;
  final Color? iconColor;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black12,
          )),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          color: iconColor,
          size: 20.0,
        ),
      ),
    );
  }
}
