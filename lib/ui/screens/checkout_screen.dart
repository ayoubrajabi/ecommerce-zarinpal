import 'package:beamer/beamer.dart';
import 'package:ecommerce_zarinpal/constants/constants.dart';
import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:ecommerce_zarinpal/ui/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class CheckoutScreen extends StatefulWidget {
  final String? status;
  final String? authority;
  final GlobalKey<BeamerState>? beamerKey;

  const CheckoutScreen({
    Key? key,
    @required this.status,
    @required this.authority,
    this.beamerKey,
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
                      child: SizedBox(
                        height: 150.0,
                        width: double.infinity,
                        child: Lottie.asset(
                          LottieAssets.checkMarkSuccess!,
                          repeat: false,
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
                      onPressed: () => context.beamTo(
                        NavLocation(
                          beamerKey: widget.beamerKey,
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
              return Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SizedBox(
                        height: 150.0,
                        width: double.infinity,
                        child: Lottie.asset(
                          LottieAssets.errorMark!,
                          repeat: false,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40.0),
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      decoration: BoxDecoration(
                          color: Colors.red.shade100.withAlpha(120),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                        child: Text(
                          'پرداخت اینترنتی شما با شکست مواجه شد',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.red.shade800,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 90.0,
                    ),
                    ElevatedButton(
                      // onPressed: () => Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => NavScreen(),
                      //   ),
                      // ),
                      onPressed: () => context.beamTo(
                        NavLocation(
                          beamerKey: widget.beamerKey,
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
                  ],
                ),
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
