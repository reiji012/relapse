import 'package:flutter/material.dart';
import 'package:relapse/model/card_item.dart';
import '../pages/purpose_detail/purpose_detail_page.dart';

class CustomCard extends StatefulWidget {
  CustomCard(this.cardItem);

  CardItem cardItem;

  @override
  State<StatefulWidget> createState() {
    return CustomCardState(cardItem);
  }
}

class CustomCardState extends State<CustomCard> {
  CustomCardState(this.cardItem);

  CardItem cardItem;
  var _hasPadding = false;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardItem.title,
      child: Material(
        type: MaterialType.transparency,
        child: content(),
      ),
    );
  }

  Widget content() {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 80),
      padding: EdgeInsets.all(_hasPadding ? 10 : 0),
      child: GestureDetector(
        onTapDown: (TapDownDetails downDetails) {
          setState(() {
            _hasPadding = true;
          });
        },
        onTap: () {
          print('Card tapped.');
          setState(() {
            _hasPadding = false;
          });
          Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
                pageBuilder: (_, __, ___) => PurposeDetailPage(cardItem),
              ));
        },
        onTapCancel: () {
          setState(() {
            _hasPadding = false;
          });
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset('image/image.jpg', fit: BoxFit.fill),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  cardItem.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          elevation: 10,
        ),
      ),
    );
  }
}
