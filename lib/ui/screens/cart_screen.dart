import 'package:ecommerce_zarinpal/constants/constants.dart';
import 'package:ecommerce_zarinpal/data/model/tshirt_model.dart';
import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:ecommerce_zarinpal/ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';

// ignore: use_key_in_widget_constructors
class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: BlocBuilder<AddToBagCubit, List<TshirtModel>>(
          builder: (context, state) {
            if (state.isEmpty) {
              return SizedBox(
                height: 500.0,
                width: double.infinity,
                child: Column(
                  children: [
                    Lottie.asset(
                      LottieAssets.emptyCart!,
                      repeat: true,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40.0),
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade100.withAlpha(120),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Center(
                        child: Text(
                          'سبد خرید شما خالی است',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Stack(
              children: [
                SingleChildScrollView(
                  controller: ScrollController(),
                  physics: const BouncingScrollPhysics(),
                  child: BlocBuilder<AddToBagCubit, List<TshirtModel>>(
                    builder: (context, addToBagState) {
                      return SizedBox(
                        height: addToBagState.length * 280.0 + 100.0,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: addToBagState.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Dismissible(
                            onDismissed: (direction) {
                              context
                                  .read<AddToBagCubit>()
                                  .deleteFromBag(state[index]);
                              setState(() {});
                            },
                            key: UniqueKey(),
                            child: ProductCardItem(
                              productImageUrl: addToBagState[index].imageUrl,
                              productName: addToBagState[index].name,
                              productPrice: addToBagState[index].price,
                              state: addToBagState[index],
                              deleteButton: () {
                                context
                                    .read<AddToBagCubit>()
                                    .deleteFromBag(state[index]);
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                CustomBottomSheet(),
              ],
            );
          },
        ),
      ),
    );
  }
}
