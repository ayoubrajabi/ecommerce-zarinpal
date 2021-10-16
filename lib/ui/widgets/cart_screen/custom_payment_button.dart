import 'package:flutter/material.dart';

class CustomPaymentButton extends StatelessWidget {
  const CustomPaymentButton({
    Key? key,
    @required this.child,
    @required this.onPressed,
  }) : super(key: key);

  final Function()? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.amber),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
