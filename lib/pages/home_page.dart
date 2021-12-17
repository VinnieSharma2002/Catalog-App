import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import "package:velocity_x/velocity_x.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String name = "Vinnie";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
      // appBar: AppBar(
      //   title: Text(
      //     "Catalog App",
      //     style: TextStyle(color: Colors.black),
      //   ),
      // ),
      // body: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
      //         ? GridView.builder(
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                 crossAxisCount: 2,
      //                 mainAxisSpacing: 16,
      //                 crossAxisSpacing: 16),
      //             itemBuilder: (context, index) {
      //               final item = CatalogModel.items[index];
      //               return Card(
      //                   clipBehavior: Clip.antiAlias,
      //                   shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(10)),
      //                   child: GridTile(
      //                     header: Container(
      //                       child: Text(
      //                         item.name,
      //                         style: TextStyle(color: Colors.white),
      //                       ),
      //                       padding: EdgeInsets.all(12),
      //                       decoration: BoxDecoration(color: Colors.deepPurple),
      //                     ),
      //                     child: Image.network(item.image),
      //                     footer: Container(
      //                       child: Text(
      //                         item.price.toString(),
      //                         style: TextStyle(color: Colors.white),
      //                       ),
      //                       padding: EdgeInsets.all(12),
      //                       decoration: BoxDecoration(color: Colors.black),
      //                     ),
      //                   ));
      //             },
      //             itemCount: CatalogModel.items.length,
      //           )
      //         : Center(
      //             child: CircularProgressIndicator(),
      //           )),
      // drawer: MyDrawer(),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.DarkBluishColor).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
