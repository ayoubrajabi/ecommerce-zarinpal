import 'package:beamer/beamer.dart';
import 'package:ecommerce_zarinpal/data/model/tshirt_model.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:transparent_image/transparent_image.dart';

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
  bool? heartActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.beamToNamed('product/${widget.tshirtInfo!.name}'),
      // onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) =>
      //         ProductDetailScreen(tshirtInfo: widget.tshirtInfo),
      //   ),
      // ),
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: const Color(0xfff7f7f7),
          border: Border.all(
            color: Colors.grey.shade100,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.tshirtInfo!.imageUrl!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 230,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, right: 10.0),
              child: Text(
                widget.tshirtInfo!.name!,
                style: const TextStyle(
                  fontSize: 11.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                IconButton(
                  onPressed: () {
                    setState(() {
                      heartActive = !heartActive!;
                    });
                  },
                  icon: Icon(
                    heartActive! ? IconlyBold.heart : IconlyLight.heart,
                    color: heartActive! ? Colors.red : Colors.black,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
