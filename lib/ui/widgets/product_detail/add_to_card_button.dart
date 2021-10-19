import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AddToCardButton extends StatelessWidget {
  const AddToCardButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color(0xfff99c00).withAlpha(100),
            ),
            elevation: MaterialStateProperty.all(0.0),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'افزودن به سبد خرید',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Icon(
                IconlyLight.bag,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
