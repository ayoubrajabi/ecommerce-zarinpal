import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class CheckoutScreen extends StatefulWidget {
  final String? status;
  final String? authority;

  const CheckoutScreen({
    Key? key,
    @required this.status,
    @required this.authority,
  }) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  void initState() {
    final _paymentRequest = context.read<PaymentRequestCubit>().state;
    context
        .read<VerifyPaymentBloc>()
        .add(StartVerify(_paymentRequest, widget.authority, widget.status));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<VerifyPaymentBloc, VerifyPaymentState>(
          builder: (context, verifyState) {
            if (verifyState is VerifyIsLoded) {
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: Card(
                  elevation: 40.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.black12, width: 1.0),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 130.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              IconlyLight.buy,
                              size: 35.0,
                            ),
                            SizedBox(
                              width: 40.0,
                            ),
                            Text('رسید خرید شما'),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade50,
                        radius: 60.0,
                        child: const Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 70.0,
                        ),
                      ),
                      const Divider(
                        endIndent: 30.0,
                        indent: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text(verifyState.refID.toString()),
                              Icon(
                                Icons.card_membership,
                                color: Colors.amber.shade200,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(widget.authority!.replaceRange(0, 30, '')),
                              Icon(
                                Icons.verified,
                                color: Colors.amber.shade200,
                              )
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        endIndent: 30.0,
                        indent: 30.0,
                      ),
                    ],
                  ),
                ),
              );
              // return Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text('status of payment is:  ${widget.status}'),
              //     Text('authority of payment is:  ${widget.authority}'),
              //     Text(
              //         'authority of payment is:  ${verifyState.isPaymentSuccess}'),
              //     Text('authority of payment is:  ${verifyState.refID}'),
              //     ElevatedButton(
              //       onPressed: () {},
              //       child: const Text('test'),
              //     ),
              //     ElevatedButton(
              //       onPressed: () {},
              //       child: const Text('test2'),
              //     ),
              //   ],
              // );
            } else if (verifyState is VerifyError) {
              return const SizedBox(
                child: Center(
                  child: Text('Error In Payment'),
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
