class ShowCaseProduct {
  String? discount; // new - indirim
  String? photoUrl;
  String? productName; // ürün adı

  ShowCaseProduct({this.discount, this.photoUrl, this.productName});
}

List<ShowCaseProduct> showCaseProducts = [
  ShowCaseProduct(
      discount: "New",
      photoUrl: 'assets/images/mac/iMac.jpg',
      productName: 'Smart iMac Pro'),
  ShowCaseProduct(
      discount: "New",
      photoUrl: 'assets/images/iphone/ipohe_12_pro_max.jpg',
      productName: 'iPhone 12 Pro'),
  ShowCaseProduct(
      discount: "New",
      photoUrl: 'assets/images/airTag.jpg',
      productName: 'AirTag'),
  ShowCaseProduct(
      discount: "New",
      photoUrl: 'assets/images/mac/air_m2.jpg',
      productName: 'Macbook Air M2'),
  ShowCaseProduct(
      discount: "New",
      photoUrl: 'assets/images/mac/pro.jpg',
      productName: 'Macbook Pro 13'),
  ShowCaseProduct(
      discount: "New",
      photoUrl: 'assets/images/watch/w7.jpg',
      productName: 'Apple Watch 7'),
  ShowCaseProduct(
      discount: "New",
      photoUrl: 'assets/images/ipad/ipad_pro.jpg',
      productName: 'iPad Pro'),
  ShowCaseProduct(
      discount: "New",
      photoUrl: 'assets/images/mac/pro2.jpg',
      productName: 'Macbook Pro 16'),
  ShowCaseProduct(
      discount: "New",
      photoUrl: 'assets/images/airtag_loop.jpg',
      productName: 'AirTag Loop'),
  ShowCaseProduct(
      discount: "New",
      photoUrl: 'assets/images/airpods/airpods3.jpg',
      productName: 'Airpods 3'),
];
