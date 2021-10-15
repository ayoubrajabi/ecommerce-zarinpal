import 'package:ecommerce_zarinpal/data/data.dart';
import 'package:flutter/material.dart';

class ItemsRailBar extends StatefulWidget {
  const ItemsRailBar({Key? key}) : super(key: key);

  @override
  State<ItemsRailBar> createState() => _ItemsRailBarState();
}

class _ItemsRailBarState extends State<ItemsRailBar> {
  int? indexSelected = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: double.infinity,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        itemCount: itemRailData.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final _info = itemRailData[index];
          return GestureDetector(
            onTap: () => setState(() {
              indexSelected = index;
            }),
            child: Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                color: _info.name == itemRailData[indexSelected!].name
                    ? const Color(0xfffaeccd)
                    : Colors.grey.shade50,
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Center(
                  child: Text(
                _info.name!,
                style: TextStyle(
                  color: _info.name == itemRailData[indexSelected!].name
                      ? Colors.orange
                      : Colors.grey.shade400,
                ),
              )),
            ),
          );
        },
      ),
    );
  }
}
