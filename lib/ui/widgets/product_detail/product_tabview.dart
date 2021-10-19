import 'package:flutter/material.dart';

class ProductTabView extends StatefulWidget {
  const ProductTabView({Key? key}) : super(key: key);

  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          padding: const EdgeInsets.only(left: 150.0, top: 10.0),
          labelColor: Colors.orangeAccent,
          unselectedLabelColor: Colors.grey,
          labelStyle: const TextStyle(
            fontFamily: 'Shabnam',
            fontSize: 14.0,
          ),
          indicatorColor: Colors.orangeAccent,
          tabs: const [
            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Text('توضیجات'),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Text('بررسی'),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: SizedBox(
            height: 110.0,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: const [
                Text(
                  'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است. ',
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  'کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد.',
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
