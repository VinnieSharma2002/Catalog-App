import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel{

  // catalog field
  late CatalogModel _catalog;

  // Collection of IDs - store IDs of each item
  final List<int> _itemIDs = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    assert(newCatalog!=null);
    _catalog=newCatalog;
  }


  List<Item> get items => _itemIDs.map((id) => _catalog.getById(id)).toList();

  
  //Get Total Price
  num get totalprice => items.fold(0, (total, current)=> total + current.price);


  //Remove Item
  void remove(Item item){
    _itemIDs.remove(item.id);
  }
}


class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIDs.add(item.id);
  }
}