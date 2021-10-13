import 'package:ecommerce_zarinpal/data/data.dart';
import 'package:ecommerce_zarinpal/data/model/tshirt_model.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:transparent_image/transparent_image.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            backgroundColor: _theme.scaffoldBackgroundColor,
            elevation: 0.0,
            toolbarHeight: 90.0,
            actions: List<AppBarCustomButton>.generate(
              2,
              (i) {
                final _icons = [
                  IconlyLight.search,
                  IconlyLight.filter,
                ];
                return AppBarCustomButton(
                  icon: _icons[i],
                  color: Colors.transparent,
                  iconColor: const Color(0xff58485b),
                  margin: const EdgeInsets.only(left: 10.0),
                );
              },
            ),
            leading: AppBarCustomButton(
              icon: IconlyBold.category,
              color: _theme.primaryColor,
              iconColor: Colors.white,
              margin: const EdgeInsets.only(right: 10.0),
            ),
            bottom: const PreferredSize(
              preferredSize: Size(double.infinity, 50.0),
              child: ItemsRailBar(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: itemRailData.length * 460.0,
              width: double.infinity,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 0.0,
                  childAspectRatio: 1.0,
                  mainAxisExtent: 365.0,
                ),
                itemCount: tshirtData.length,
                itemBuilder: (context, index) {
                  final tshirtInfo = tshirtData[index];
                  return TshirtCardWidget(
                    tshirtInfo: tshirtInfo,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarCustomButton extends StatelessWidget {
  const AppBarCustomButton({
    Key? key,
    @required this.icon,
    @required this.color,
    @required this.iconColor,
    @required this.margin,
  }) : super(key: key);

  final IconData? icon;
  final Color? color;
  final Color? iconColor;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black12,
          )),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          color: iconColor,
          size: 20.0,
        ),
      ),
    );
  }
}

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
                    : const Color(0xfff7f7f7),
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

class TshirtCardWidget extends StatefulWidget {
  const TshirtCardWidget({
    Key? key,
    this.tshirtInfo,
  }) : super(key: key);

  final TshirtModel? tshirtInfo;

  @override
  State<TshirtCardWidget> createState() => _TshirtCardWidgetState();
}

class _TshirtCardWidgetState extends State<TshirtCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade100,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.tshirtInfo!.imageUrl!,
                fit: BoxFit.contain,
                width: double.infinity,
                height: 230,
              ),
            ),
            Text(
              widget.tshirtInfo!.name!,
              style: const TextStyle(
                fontSize: 11.0,
              ),
            ),
            Divider(
              color: Colors.grey.shade200,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  '${widget.tshirtInfo!.price!} تومان',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
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
