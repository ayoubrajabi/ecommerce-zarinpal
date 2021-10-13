import 'package:ecommerce_zarinpal/data/model/tshirt_model.dart';
import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:ecommerce_zarinpal/ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:transparent_image/transparent_image.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int productNumber = 1;
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'سبد خرید',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
          ),
        ),
        actions: const [
          AppBarCustomButton(
            color: Colors.white,
            icon: IconlyLight.bookmark,
            iconColor: Color(0xff58485b),
            margin: EdgeInsets.only(left: 10.0),
          ),
        ],
        toolbarHeight: 90.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView(
        controller: ScrollController(),
        children: [
          BlocBuilder<AddToBagCubit, List<TshirtModel>>(
            builder: (context, state) {
              return SizedBox(
                height: state.length * 220.0,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: state.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
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
                                  image: state[index].imageUrl!,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    state[index].name!,
                                    style: const TextStyle(fontSize: 14.0),
                                  ),
                                  Text(
                                    'قیمت:  ${state[index].price!}  تومان',
                                    style: const TextStyle(
                                        fontSize: 12.0, color: Colors.grey),
                                  ),
                                  const Text(
                                    'سایز:  S',
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.grey),
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
                                    context
                                        .read<AddToBagCubit>()
                                        .deleteFromBag(state[index]);
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
                    }),
              );
            },
          )
        ],
      ),
    );
  }
}
