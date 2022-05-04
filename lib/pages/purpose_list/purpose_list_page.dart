import 'package:flutter/material.dart';
import 'package:relapse/model/card_item.dart';

import '../../widgets/purpose_card.dart';

class PurposeListPage extends StatefulWidget {
  @override
  _PurposeListPageState createState() => _PurposeListPageState();
}

final itemData = [
  CardItem(
    title: 'vegetable',
    contents:
        'What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
  ),
  CardItem(
    title: 'discover',
    contents:
        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using `Content here, content her`, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
  ),
  CardItem(
    title: 'specific',
    contents:
        'What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
  ),
  CardItem(
    title: 'account',
    contents:
        'What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
  ),
];

class _PurposeListPageState extends State<PurposeListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                colors: [
                  const Color.fromRGBO(232, 204, 110, 1),
                  const Color.fromRGBO(250, 128, 119, 1),
                ],
                stops: const [
                  0.0,
                  1.0,
                ],
              ),
            ),
          ),
          Center(
            child: CardPageView(
              cardItemList: itemData,
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CardPageView extends StatelessWidget {
  CardPageView({
    Key? key,
    required this.cardItemList,
  }) : super(key: key);
  List<CardItem> cardItemList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 315,
      child: PageView(
        controller: PageController(viewportFraction: 0.8),
        children: <Widget>[
          for (var item in cardItemList)
            Container(
              // 間隔が狭くなるので若干marginを付けてあげる
              margin: EdgeInsets.only(right: 10, bottom: 20),
              child: CustomCard(item),
            )
        ],
      ),
    );
  }
}
