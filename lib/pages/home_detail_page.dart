import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  })  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.xl4.red800.bold.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(context.theme.buttonColor),
                        shape: MaterialStateProperty.all(const StadiumBorder())),
                    child: "Add to Cart".text.make())
                .wh(120, 50)
          ],
        ).py32(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
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
                        .color(context.accentColor)
                        .make(),
                    catalog.desc.text
                        .textStyle(context.captionStyle!)
                        .xl
                        .make(),
                    10.heightBox,
                    "Aliquyam dolores stet clita sanctus gubergren dolor amet, lorem sed elitr stet sed et, nonumy et dolor dolor vero duo duo, justo ipsum elitr kasd dolor tempor dolores eos justo dolore. Sed stet magna elitr dolores dolores. Duo at ea accusam et erat ut gubergren. Diam sed sed dolor gubergren."
                        .text
                        .textStyle(context.captionStyle!)
                        .make()
                        .p16()
                  ],
                ).py64(),
                color: context.cardColor,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
