import 'package:ecommerce_zarinpal/data/model/tshirt_model.dart';
import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:ecommerce_zarinpal/ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zarinpal/zarinpal.dart';

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
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: ScrollController(),
              physics: const BouncingScrollPhysics(),
              child: BlocBuilder<AddToBagCubit, List<TshirtModel>>(
                builder: (context, state) {
                  return SizedBox(
                    height: state.length * 220.0 + 100.0,
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
                                      'قیمت:  ${(state[index].price! * productNumber)}  تومان',
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
                                      setState(() {});
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
                      },
                    ),
                  );
                },
              ),
            ),
            Positioned(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        PaymentRequest _paymentRequest = PaymentRequest();
                        _paymentRequest.setIsSandBox(true);
                        _paymentRequest.setMerchantID(
                            "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx");
                        _paymentRequest.setAmount(10000);
                        _paymentRequest.setDescription('خرید تی شرت');
                        _paymentRequest.setCallbackURL('zar://zarinpal.app');

                        ZarinPal().startPayment(_paymentRequest,
                            (status, paymentGatewayUri) async {
                          await canLaunch(paymentGatewayUri!)
                              ? await launch(paymentGatewayUri)
                              : throw 'Could not launch url';
                        });
                      },
                      child: Text(
                        'پرداخت با زرین پال',
                        style: TextStyle(
                          color: _theme.primaryColor,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
