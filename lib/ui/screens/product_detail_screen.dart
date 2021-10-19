import 'package:badges/badges.dart';
import 'package:ecommerce_zarinpal/data/model/tshirt_model.dart';
import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:ecommerce_zarinpal/ui/widgets/main_screen/mainscreenwidgets.dart';
import 'package:ecommerce_zarinpal/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    Key? key,
    @required this.tshirtInfo,
  }) : super(key: key);

  static const String path = 'product-detail';
  final TshirtModel? tshirtInfo;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: AppBarCustomButton(
              onPressed: () => Navigator.pop(context),
              color: const Color(0xff58485b),
              icon: IconlyLight.arrow_right_2,
              iconColor: Colors.white,
              margin: const EdgeInsets.only(right: 10.0),
            ),
            actions: [
              BlocBuilder<AddToBagCubit, List<TshirtModel>>(
                builder: (context, state) {
                  return Badge(
                    badgeColor: Colors.redAccent,
                    badgeContent: Text(
                      state.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    elevation: 0.0,
                    showBadge: state.isNotEmpty,
                    padding: const EdgeInsets.all(10.0),
                    position: const BadgePosition(
                      start: 0.0,
                      bottom: 0.0,
                    ),
                    child: const AppBarCustomButton(
                      color: Colors.white,
                      icon: IconlyLight.bag,
                      iconColor: Color(0xff58485b),
                      margin: EdgeInsets.only(left: 10.0),
                    ),
                  );
                },
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: widget.tshirtInfo!.imageUrl!,
                      fit: BoxFit.fitHeight,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.35,
                    ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProductPrice(
                            tshirtInfo: widget.tshirtInfo,
                          ),
                          AddToCardButton(
                            onPressed: () {
                              setState(
                                () {
                                  final state =
                                      context.read<AddToBagCubit>().state;
                                  if (!state.contains(widget.tshirtInfo)) {
                                    context
                                        .read<AddToBagCubit>()
                                        .addToBag(widget.tshirtInfo!);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text(
                                                'این محصول به سبد اضافه شده است.',
                                                style: TextStyle(
                                                  fontFamily: 'Shabnam',
                                                ),
                                              ),
                                              Icon(
                                                IconlyLight.info_square,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        margin: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height -
                                              80.0,
                                          right: 20.0,
                                          left: 20.0,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      const SelectProductSize(),
                      const ProductTabView(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
