import 'package:ecommerce_zarinpal/data/model/tshirt_model.dart';
import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    Key? key,
    @required this.tshirtInfo,
  }) : super(key: key);

  final TshirtModel? tshirtInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        height: 60.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List<FittedBox>.generate(
            2,
            (i) => FittedBox(
              child: Text(
                i == 0 ? tshirtInfo!.name! : '${tshirtInfo!.price!}  تومان',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
