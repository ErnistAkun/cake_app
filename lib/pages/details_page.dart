import 'package:cake_app/constants/colors.dart';
import 'package:cake_app/constants/text_style.dart';
import 'package:cake_app/data/items.dart';
import 'package:cake_app/widget/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  final Cakes cake;
  const DetailPage({
    Key? key,
    required this.cake,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: height / 2,
                width: 360.0,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: const BoxDecoration(
                  color: pink02,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                  ),
                ),
                child: Image.asset(widget.cake.image),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cake.name,
                    style: txtHeading.copyWith(
                      color: black,
                      fontSize: 22.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      StarRating(rating: widget.cake.rating),
                      Text('${widget.cake.rating}'),
                      const SizedBox(width: 120.0),
                      miniButton(
                        onTap: () {
                          if (qty > 1) setState(() => qty--);
                        },
                        icon: Icons.remove,
                        iconColor: mainColor,
                        bgColor: pink01,
                      ),
                      Text(
                        qty > 9 ? '$qty' : '0$qty',
                        style: txtItemCard.copyWith(
                          color: mainColor,
                        ),
                      ),
                      miniButton(
                        onTap: () {
                          setState(() => qty++);
                        },
                        icon: Icons.add,
                        bgColor: mainColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    width: 360.0,
                    height: 200,
                    child: ListView(
                      padding: EdgeInsets.only(bottom: 50.0),
                      physics: BouncingScrollPhysics(),
                      children: [
                        ReadMoreText(
                          widget.cake.destription,
                          trimLines: 7,
                          trimMode: TrimMode.Line,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget miniButton({
    required Function() onTap,
    required Color bgColor,
    required IconData icon,
    Color? iconColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: bgColor,
        radius: 12.0,
        child: Icon(
          icon,
          color: iconColor != null ? iconColor : white,
          size: 15,
        ),
      ),
    );
  }
}
