import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.xl4.red800.bold.make(),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(MyTheme.DarkBluishColor),
                    shape: MaterialStateProperty.all(StadiumBorder())),
                child: "Buy".text.make()).wh(100, 50)
          ],
        ).py32(),
      ),
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4.bold
                        .color(MyTheme.DarkBluishColor)
                        .make(),
                    catalog.desc.text
                        .textStyle(context.captionStyle!)
                        .xl
                        .make(),
                    10.heightBox,
                  ],
                ).py64(),
                color: Colors.white,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
