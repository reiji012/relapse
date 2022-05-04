import 'package:flutter/material.dart';
import 'package:relapse/model/card_item.dart';
import 'package:relapse/pages/purpose_list/purpose_list_page.dart';

class PurposeDetailPage extends StatelessWidget {
  PurposeDetailPage(this.cardItem);

  final CardItem cardItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, //Widgetの全体の背景を透明にする
      body: Hero(
        tag: cardItem.title,
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            color: Colors.white, //HeroWidget以下のツリーの背景を白色にする,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  stretch: false,
                  floating: false,
                  toolbarHeight: 255,
                  backgroundColor: Colors.white,
                  pinned: true,
                  leading: Container(),
                  elevation: 0,
                  excludeHeaderSemantics: true,
                  flexibleSpace: Container(
                    child: imageContents(context),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          cardItem.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: Text(cardItem.contents),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 画像Widget
  Widget imageContents(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      color: Colors.white,
      child: Container(
        child: Stack(
          children: <Widget>[
            Image.asset(
              'image/image.jpg',
              fit: BoxFit.fitWidth,
            ),
            Column(
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: statusBarHeight),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween, // これで両端に寄せる
                    children: <Widget>[
                      Container(
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.pop(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return PurposeListPage();
                              }),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
