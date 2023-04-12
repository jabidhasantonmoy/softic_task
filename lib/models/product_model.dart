class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.barcode,
    this.description,
    this.subCategory,
    this.brand,
    this.quantity,
    this.productPrice,
    this.image,
  });

  ProductModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    barcode = json['barcode'];
    description = json['description'];
    subCategory = json['subCategory'] != null
        ? SubCategory.fromJson(json['subCategory'])
        : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    quantity =
        json['quantity'] != null ? Quantity.fromJson(json['quantity']) : null;
    productPrice = json['productPrice'] != null
        ? ProductPrice.fromJson(json['productPrice'])
        : null;
    image = json['image'];
  }
  num? id;
  String? name;
  String? barcode;
  String? description;
  SubCategory? subCategory;
  Brand? brand;
  Quantity? quantity;
  ProductPrice? productPrice;
  String? image;
  ProductModel copyWith({
    num? id,
    String? name,
    String? barcode,
    String? description,
    SubCategory? subCategory,
    Brand? brand,
    Quantity? quantity,
    ProductPrice? productPrice,
    String? image,
  }) =>
      ProductModel(
        id: id ?? this.id,
        name: name ?? this.name,
        barcode: barcode ?? this.barcode,
        description: description ?? this.description,
        subCategory: subCategory ?? this.subCategory,
        brand: brand ?? this.brand,
        quantity: quantity ?? this.quantity,
        productPrice: productPrice ?? this.productPrice,
        image: image ?? this.image,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['barcode'] = barcode;
    map['description'] = description;
    if (subCategory != null) {
      map['subCategory'] = subCategory?.toJson();
    }
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    if (quantity != null) {
      map['quantity'] = quantity?.toJson();
    }
    if (productPrice != null) {
      map['productPrice'] = productPrice?.toJson();
    }
    map['image'] = image;
    return map;
  }
}

class ProductPrice {
  ProductPrice({
    this.id,
    this.price,
    this.unitPrice,
    this.mrp,
  });

  ProductPrice.fromJson(dynamic json) {
    id = json['id'];
    price = json['price'];
    unitPrice = json['unitPrice'];
    mrp = json['mrp'];
  }
  num? id;
  num? price;
  num? unitPrice;
  num? mrp;
  ProductPrice copyWith({
    num? id,
    num? price,
    num? unitPrice,
    num? mrp,
  }) =>
      ProductPrice(
        id: id ?? this.id,
        price: price ?? this.price,
        unitPrice: unitPrice ?? this.unitPrice,
        mrp: mrp ?? this.mrp,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['price'] = price;
    map['unitPrice'] = unitPrice;
    map['mrp'] = mrp;
    return map;
  }
}

class Quantity {
  Quantity({
    this.id,
    this.quantity,
    this.unit,
    this.unitValue,
    this.pastQuantity,
  });

  Quantity.fromJson(dynamic json) {
    id = json['id'];
    quantity = json['quantity'];
    unit = json['unit'];
    unitValue = json['unitValue'];
    pastQuantity = json['pastQuantity'];
  }
  num? id;
  num? quantity;
  String? unit;
  num? unitValue;
  num? pastQuantity;
  Quantity copyWith({
    num? id,
    num? quantity,
    String? unit,
    num? unitValue,
    num? pastQuantity,
  }) =>
      Quantity(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
        unit: unit ?? this.unit,
        unitValue: unitValue ?? this.unitValue,
        pastQuantity: pastQuantity ?? this.pastQuantity,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['quantity'] = quantity;
    map['unit'] = unit;
    map['unitValue'] = unitValue;
    map['pastQuantity'] = pastQuantity;
    return map;
  }
}

class Brand {
  Brand({
    this.id,
    this.name,
    this.description,
    this.image,
  });

  Brand.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }
  num? id;
  String? name;
  String? description;
  String? image;
  Brand copyWith({
    num? id,
    String? name,
    String? description,
    String? image,
  }) =>
      Brand(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['image'] = image;
    return map;
  }
}

class SubCategory {
  SubCategory({
    this.id,
    this.name,
    this.image,
    this.description,
    this.category,
  });

  SubCategory.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
  }
  num? id;
  String? name;
  dynamic image;
  String? description;
  Category? category;
  SubCategory copyWith({
    num? id,
    String? name,
    dynamic image,
    String? description,
    Category? category,
  }) =>
      SubCategory(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        description: description ?? this.description,
        category: category ?? this.category,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['description'] = description;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    return map;
  }
}

class Category {
  Category({
    this.id,
    this.name,
    this.image,
    this.description,
  });

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
  }
  num? id;
  String? name;
  String? image;
  String? description;
  Category copyWith({
    num? id,
    String? name,
    String? image,
    String? description,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        description: description ?? this.description,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['description'] = description;
    return map;
  }
}
