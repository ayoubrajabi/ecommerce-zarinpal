import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zarinpal/zarinpal.dart';

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
    final addToBagState = context.read<CartBloc>().state;
    int? sumPrice = 0;

    if (addToBagState.tshirtModel!.isNotEmpty) {
      sumPrice = addToBagState.tshirtModel!
          .map((tshirt) => tshirt.price)
          .toList()
          .reduce((a, b) => a! + b!);
    }

    final PaymentRequest? paymentRequest = request(sumPrice);

    context.read<PaymentRequestCubit>().getPaymentRequest(paymentRequest!);

    context.read<StartPaymentBloc>().add(Start(paymentRequest));
  }
}
