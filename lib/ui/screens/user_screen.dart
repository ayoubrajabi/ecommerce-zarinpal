import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class UserScreen extends StatelessWidget {
  UserScreen({Key? key}) : super(key: key);

  final _userItemsInfo = <String, IconData>{
    'مشخصات': IconlyLight.info_square,
    'آدرس ها': IconlyLight.location,
    'خرید ها': IconlyLight.bag,
    'آدرس های من': IconlyLight.location,
    'روش های پرداخت': IconlyLight.wallet,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 120.0,
            margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: Colors.grey.shade200,
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: 120.0,
                  width: 100.0,
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade100.withAlpha(100),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.person,
                      color: Colors.amber,
                      size: 45.0,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Text('کاربر'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _userItemsInfo
                    .map(
                      (title, icon) => MapEntry(
                        title,
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      icon,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      width: 240.0,
                                      child: Text(
                                        title,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      IconlyLight.arrow_left_2,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0.0),
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                              ),
                            ),
                            const Divider(),
                          ],
                        ),
                      ),
                    )
                    .values
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
