import 'package:flutter/material.dart';
import 'package:zarinpal/zarinpal.dart';

class CheckoutScreen extends StatelessWidget {
  final String? status;
  final String? authority;

  const CheckoutScreen({
    Key? key,
    @required this.status,
    @required this.authority,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Column(
        children: [
          Text('status of payment is:  $status'),
          Text('authority of payment is:  $authority'),
          ElevatedButton(
            onPressed: () {
              PaymentRequest _paymentRequest = PaymentRequest();
              _paymentRequest.setIsSandBox(true);
              _paymentRequest.setAmount(10000);
              _paymentRequest
                  .setMerchantID("xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx");
              _paymentRequest.setAuthority(authority);

              ZarinPal()
                  .verificationPayment(status!, authority!, _paymentRequest,
                      (isSucsses, refID, paymentRequest) {
                print(refID);
                print(isSucsses);
              });
            },
            child: Text('test'),
          ),
          ElevatedButton(
            onPressed: () {
              print(status);
              print(authority);
            },
            child: Text('test2'),
          ),
        ],
      ))),
    );
  }
}
