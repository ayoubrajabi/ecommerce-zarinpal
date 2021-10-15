import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zarinpal/zarinpal.dart';

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
        maxHeight: 90.0,
        elevation: 60.0,
        autoSwiped: true,
        draggableBody: false,
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
                    width: 180.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Text(
                        '100000  تومان',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Container(
          height: 50.0,
          width: double.infinity,
          color: _theme.primaryColor,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: BlocBuilder<StartPaymentBloc, StartPaymentState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () async {
                    if (state is PaymentIsLoaded) {
                      await canLaunch(state.url!)
                          ? await launch(state.url!)
                          : throw 'Could not launch url';
                    }

                    if (state is PaymentNotStarted) {
                      PaymentRequest _paymentRequest = PaymentRequest();
                      _paymentRequest.setIsSandBox(true);
                      _paymentRequest.setMerchantID(
                          "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx");
                      _paymentRequest.setAmount(10000);
                      _paymentRequest.setDescription('خرید تی شرت');
                      _paymentRequest.setCallbackURL('zar://zarinpal.app');
                      context
                          .read<PaymentRequestCubit>()
                          .getPaymentRequest(_paymentRequest);

                      context
                          .read<StartPaymentBloc>()
                          .add(Start(_paymentRequest));
                    }
                  },
                  child: state is PaymentIsLoading
                      ? const CircularProgressIndicator()
                      : Text(
                          'پرداخت با زرین پال',
                          style: TextStyle(
                            color: _theme.primaryColor,
                          ),
                        ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
