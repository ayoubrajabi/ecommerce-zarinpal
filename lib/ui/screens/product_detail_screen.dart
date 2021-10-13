import 'package:ecommerce_zarinpal/data/model/tshirt_model.dart';
import 'package:ecommerce_zarinpal/ui/widgets/main_screen/mainscreenwidgets.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    Key? key,
    @required this.tshirtInfo,
  }) : super(key: key);

  final TshirtModel? tshirtInfo;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: _theme.scaffoldBackgroundColor,
        appBar: AppBar(
          leading: AppBarCustomButton(
            onPressed: () => Navigator.pop(context),
            color: const Color(0xff58485b),
            icon: IconlyLight.arrow_right_2,
            iconColor: Colors.white,
            margin: const EdgeInsets.only(right: 10.0),
          ),
          actions: const [
            AppBarCustomButton(
              color: Colors.white,
              icon: IconlyLight.bag,
              iconColor: Color(0xff58485b),
              margin: EdgeInsets.only(left: 10.0),
            ),
          ],
          toolbarHeight: 90.0,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Stack(
              children: [
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: tshirtInfo!.imageUrl!,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.45,
                ),
                const Positioned(
                  bottom: 20.0,
                  left: 0.0,
                  child: AppBarCustomButton(
                    icon: IconlyLight.heart,
                    color: Colors.transparent,
                    iconColor: Color(0xff58485b),
                    margin: EdgeInsets.only(left: 10.0),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List<FittedBox>.generate(
                          2,
                          (i) => FittedBox(
                            child: Text(
                              i == 0
                                  ? tshirtInfo!.name!
                                  : '${tshirtInfo!.price!}  تومان',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
