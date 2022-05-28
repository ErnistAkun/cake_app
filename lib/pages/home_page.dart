import 'package:cake_app/constants/colors.dart';
import 'package:cake_app/constants/text_style.dart';
import 'package:cake_app/data/category.dart';
import 'package:cake_app/data/items.dart';
import 'package:cake_app/pages/details_page.dart';
import 'package:cake_app/widget/Item_card_02.dart';
import 'package:cake_app/widget/category_btn.dart';
import 'package:cake_app/widget/circurl_btn.dart';
import 'package:cake_app/widget/item_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                              text: 'Будете ли вы', style: txtHeading),
                          TextSpan(
                            text: '\nещё немного',
                            style: txtHeading.copyWith(
                              color: grayColor,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: '\nторта',
                            style: txtHeading.copyWith(
                              color: black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CircleButton(
                      onTap: () {},
                      image: 'search.svg',
                    ),
                  ],
                ),
              ),
              categoryMenu(),
              Expanded(
                flex: 2,
                child: ListView.builder(
                    padding: const EdgeInsets.only(top: 50.0),
                    itemCount: cakes.length,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (itemBuilder, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => DetailPage(),
                            ),
                          );
                        },
                        child: ItemCard(
                          cake: cakes[index],
                        ),
                      );
                    }),
              ),
              const Text(
                'Рекомендуемые',
                style: TextStyle(
                  fontSize: 21.0,
                  color: black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                    itemCount: cakes.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(top: 40.0, bottom: 40.0),
                    itemBuilder: (itemBuilder, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: ItemCard02(cake: cakes[index]),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  categoryMenu() {
    return Container(
      height: 80.0,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (itemBulder, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {
                setState(() => selectIndex = index);
              },
              child: CategoryButton(
                category: category,
                index: selectIndex,
              ),
            );
          }),
    );
  }
}
