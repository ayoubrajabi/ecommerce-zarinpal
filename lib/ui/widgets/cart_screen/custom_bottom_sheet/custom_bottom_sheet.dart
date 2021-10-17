import 'package:ecommerce_zarinpal/data/model/tshirt_model.dart';
import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:zarinpal/zarinpal.dart';

import '../../widgets.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: SolidBottomSheet(
        maxHeight: 400.0,
        elevation: 60.0,
        autoSwiped: true,
        draggableBody: true,
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
                      child: BlocBuilder<AddToBagCubit, List<TshirtModel>>(
                        builder: (context, addToBagState) {
                          int? sumPrice = 0;

                          if (addToBagState.isNotEmpty) {
                            sumPrice = addToBagState
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

class Payment {
  PaymentRequest? request(int? price) {
    return PaymentRequest()
      ..setIsSandBox(true)
      ..setMerchantID("xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
      ..setAmount(price!)
      ..setCallbackURL('zar://zarinpal.app')
      ..setIsZarinGateEnable(true)
      ..setDescription("پرداخت");
  }

  void start(BuildContext context) {
    final List<TshirtModel> addToBagState = context.read<AddToBagCubit>().state;

    int? sumPrice = 0;

    if (addToBagState.isNotEmpty) {
      sumPrice = addToBagState
          .map((tshirt) => tshirt.price)
          .toList()
          .reduce((a, b) => a! + b!);
    }

    final PaymentRequest? paymentRequest = request(sumPrice);

    context.read<PaymentRequestCubit>().getPaymentRequest(paymentRequest!);

    context.read<StartPaymentBloc>().add(Start(paymentRequest));
  }
}
