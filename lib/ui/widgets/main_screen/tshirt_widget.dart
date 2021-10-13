import 'package:ecommerce_zarinpal/data/model/tshirt_model.dart';
import 'package:ecommerce_zarinpal/ui/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:transparent_image/transparent_image.dart';

import '../widgets.dart';

class TshirtCardWidget extends StatelessWidget {
  const TshirtCardWidget({
    Key? key,
    this.tshirtInfo,
  }) : super(key: key);

  final TshirtModel? tshirtInfo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailScreen(tshirtInfo: tshirtInfo),
        ),
      ),
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
                    image: tshirtInfo!.imageUrl!,
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
              tshirtInfo!.name!,
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
                  '${tshirtInfo!.price!} تومان',
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
