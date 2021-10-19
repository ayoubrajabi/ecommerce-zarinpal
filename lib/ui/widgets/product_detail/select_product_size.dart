import 'package:flutter/material.dart';

class SelectProductSize extends StatefulWidget {
  const SelectProductSize({Key? key}) : super(key: key);

  @override
  State<SelectProductSize> createState() => _SelectProductSizeState();
}

class _SelectProductSizeState extends State<SelectProductSize> {
  int? tshirtSizeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const Text('انتخاب سایز'),
        SizedBox(
          height: 80.0,
          width: double.infinity,
          child: Row(
            children: List<GestureDetector>.generate(
              4,
              (i) {
                final tshirtSize = <String>['S', 'M', 'L', 'XL'];
                return GestureDetector(
                  onTap: () => setState(() {
                    tshirtSizeIndex = i;
                  }),
                  child: Container(
                    width: 50.0,
                    height: 55.0,
                    margin: const EdgeInsets.only(left: 10.0, top: 20.0),
                    decoration: BoxDecoration(
                      color: tshirtSizeIndex == i
                          ? const Color(0xfffaeccd)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Colors.grey.shade200,
                        width: 0.8,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        tshirtSize[i],
                        style: TextStyle(
                          color: tshirtSizeIndex == i
                              ? Colors.orange
                              : Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
