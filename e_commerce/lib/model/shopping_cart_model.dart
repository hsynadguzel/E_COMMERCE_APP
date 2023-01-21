class Cart {
  int? id;
  String? name; // isim
  String? description; // ürün tanım
  String? photo;
  double? unitPrice; // birim fiyat

  Cart({this.name, this.description, this.photo, this.unitPrice});
  Cart.withID(
      {this.id, this.name, this.description, this.photo, this.unitPrice});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["description"] = description;
    map["photo"] = photo;
    map["unitPrice"] = unitPrice;
    if (id != null) {
      map["id"] = id;
    }
    return map; // bidaha bak
  }

  Cart.fromObject(dynamic o) {
    this.id = int.tryParse(o["id"].toString()); //bak .tostring()
    this.name = o["name"];
    this.description = o["description"];
    this.photo = o["photo"];
    this.unitPrice = double.tryParse(o["unitPrice"].toString());
  }
}
