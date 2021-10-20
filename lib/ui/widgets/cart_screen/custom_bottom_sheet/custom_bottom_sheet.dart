import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

import '../../widgets.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Positioned(
      bottom: 70.0,
      left: 20.0,
      right: 20.0,
      child: SolidBottomSheet(
        maxHeight: 430.0,
        elevation: 60.0,
        autoSwiped: true,
        draggableBody: false,
        smoothness: Smoothness.medium,
        toggleVisibilityOnTap: true,
        controller: SolidController(),
        headerBar: Container(
          height: 90.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: _theme.primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                width: 60.0,
                height: 5.0,
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'مجموع قیمت پرداختی شما :',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                  Container(
                    width: 160.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: BlocBuilder<CartBloc, CartState>(
                        builder: (context, addToBagState) {
                          int? sumPrice = 0;

                          if (addToBagState.tshirtModel!.isNotEmpty) {
                            sumPrice = addToBagState.tshirtModel!
                                .map((tshirt) => tshirt.price)
                                .toList()
                                .reduce((a, b) => a! + b!);
                          }

                          return Text(
                            '$sumPrice  تومان',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: CustomBottomSheetBody(),
      ),
    );
  }
}
