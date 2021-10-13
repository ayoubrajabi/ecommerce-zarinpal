import 'package:ecommerce_zarinpal/data/model/tshirt_model.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:transparent_image/transparent_image.dart';

import '../widgets.dart';

class TshirtCardWidget extends StatefulWidget {
  const TshirtCardWidget({
    Key? key,
    this.tshirtInfo,
  }) : super(key: key);

  final TshirtModel? tshirtInfo;

  @override
  State<TshirtCardWidget> createState() => _TshirtCardWidgetState();
}

class _TshirtCardWidgetState extends State<TshirtCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade100,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: widget.tshirtInfo!.imageUrl!,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: 230,
                  ),
                ),
                const AppBarCustomButton(
                  icon: IconlyLight.heart,
                  color: Colors.transparent,
                  iconColor: Color(0xff58485b),
                  margin: EdgeInsets.only(left: 10.0),
                ),
              ],
            ),
            Text(
              widget.tshirtInfo!.name!,
              style: const TextStyle(
                fontSize: 11.0,
              ),
            ),
            Divider(
              color: Colors.grey.shade200,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  '${widget.tshirtInfo!.price!} تومان',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
