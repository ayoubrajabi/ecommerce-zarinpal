import 'package:ecommerce_zarinpal/data/model/tshirt_model.dart';
import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class AddToCardButton extends StatelessWidget {
  const AddToCardButton({
    Key? key,
    @required this.tshirtInfo,
  }) : super(key: key);

  final TshirtModel? tshirtInfo;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: ElevatedButton(
          onPressed: () {
            context.read<AddToBagCubit>().addToBag(
                  TshirtModel(
                    name: tshirtInfo!.name,
                    imageUrl: tshirtInfo!.imageUrl,
                    price: tshirtInfo!.price,
                    size: tshirtInfo!.size,
                  ),
                );
          },
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
