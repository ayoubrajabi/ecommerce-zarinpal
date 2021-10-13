import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AddToCardButton extends StatelessWidget {
  const AddToCardButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color(0xfff99c00),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 0.0, vertical: 30.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('افزودن به سبد خرید'),
              SizedBox(
                width: 10.0,
              ),
              Icon(IconlyLight.bag),
            ],
          ),
        ),
      ),
    );
  }
}
