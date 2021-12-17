import 'dart:convert';

class CatalogModel {
  static late List<Item> items;
}

class Item {
  final int id;
  final String name;
  final String desc;
  final String color;
  final num price;
  final String image;

  Item(
    this.id,
    this.name,
    this.desc,
    this.color,
    this.price,
    this.image
  );

  

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    String? color,
    num? price,
    String? image,
  }) {
    return Item(
      id ?? this.id,
      name ?? this.name,
      desc ?? this.desc,
      color ?? this.color,
      price ?? this.price,
      image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'color': color,
      'price': price,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['id']?.toInt() ?? 0,
      map['name'] ?? '',
      map['desc'] ?? '',
      map['color'] ?? '',
      map['price'] ?? 0,
      map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, color: $color, price: $price, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Item &&
      other.id == id &&
      other.name == name &&
      other.desc == desc &&
      other.color == color &&
      other.price == price &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      color.hashCode ^
      price.hashCode ^
      image.hashCode;
  }
}
