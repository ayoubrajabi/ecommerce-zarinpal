import 'package:ecommerce_zarinpal/data/model/tshirt_model.dart';
import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCardItem extends StatefulWidget {
  final String? productName;
  final String? productImageUrl;
  final int? productPrice;
  final TshirtModel state;

  const ProductCardItem({
    Key? key,
    @required this.productName,
    required this.productImageUrl,
    required this.productPrice,
    required this.state,
  }) : super(key: key);

  @override
  State<ProductCardItem> createState() => _ProductCardItemState();
}

class _ProductCardItemState extends State<ProductCardItem> {
  int productNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      width: double.infinity,
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 3.0,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.productImageUrl!,
                width: 120.0,
                height: 160.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.productName!,
                  style: const TextStyle(fontSize: 14.0),
                ),
                Text(
                  'قیمت:  ${(widget.productPrice! * productNumber)}  تومان',
                  style: const TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
                const Text(
                  'سایز:  S',
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      radius: 18.0,
                      child: IconButton(
                        onPressed: () {
                          if (productNumber > 1) {
                            setState(() {
                              productNumber--;
                            });
                          }
                        },
                        icon: const Icon(
                          CupertinoIcons.minus,
                          color: Colors.black,
                          size: 20.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(productNumber.toString()),
                    const SizedBox(
                      width: 10.0,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      radius: 18.0,
                      child: IconButton(
                        onPressed: () {
                          if (productNumber < 10) {
                            setState(() {
                              productNumber++;
                            });
                          }
                        },
                        icon: const Icon(
                          CupertinoIcons.plus,
                          color: Colors.black,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 60.0,
            height: 60.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  context.read<AddToBagCubit>().deleteFromBag(widget.state);
                  setState(() {});
                },
                color: Colors.red.shade100.withAlpha(150),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 0.0,
                child: const Icon(
                  IconlyLight.delete,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
