import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:ecommerce_zarinpal/ui/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.amber,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<VerifyPaymentBloc, VerifyPaymentState>(
          builder: (context, verifyState) {
            if (verifyState is VerifyIsLoded) {
              return Container(
                color: Colors.white,
                child: Column(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade50,
                        radius: 60.0,
                        child: const Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 70.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'پرداخت اینترنتی شما با موفقیت انجام شد\n و با شماره ${widget.authority!.replaceRange(0, 30, '')} در سیستم ذخیره گردید',
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text('تاریخ:    1400/07/20'),
                              SizedBox(
                                width: 10.0,
                              ),
                              Icon(
                                CupertinoIcons.calendar,
                                color: Colors.amber,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('مبلغ:     ${verifyState.amount} تومان'),
                              const SizedBox(
                                width: 10.0,
                              ),
                              const Icon(
                                CupertinoIcons.creditcard,
                                color: Colors.amber,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      endIndent: 30.0,
                      indent: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('کد رهگیری:  ${verifyState.refID}'),
                          const Icon(
                            Icons.card_membership,
                            color: Colors.amber,
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      endIndent: 30.0,
                      indent: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                              'شناسه پرداخت:  ${widget.authority!.replaceRange(0, 30, '')}'),
                          const Icon(
                            Icons.verified,
                            color: Colors.amber,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavScreen(),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.amber,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 20.0),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 70.0, vertical: 8.0),
                        child: Text('بازگشت به صفحه اصلی'),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              );
            } else if (verifyState is VerifyError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade50,
                      radius: 60.0,
                      child: const Icon(
                        Icons.close,
                        color: Colors.red,
                        size: 70.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'پرداخت اینترنتی شما با شکست مواجه شد',
                      textAlign: TextAlign.right,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavScreen(),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.amber,
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 20.0),
                      ),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 70.0, vertical: 8.0),
                      child: Text('بازگشت به صفحه اصلی'),
                    ),
                  ),
                ],
              );
            }

            return const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
                strokeWidth: 2.0,
              ),
            );
          },
        ),
      ),
    );
  }
}
