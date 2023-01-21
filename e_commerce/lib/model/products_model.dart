class Detail {
  String? discount; // new - indirim
  String? photoUrl;
  String? productName; // ürün adı
  double? price;
  String? featuresTitle;
  String? features;
  Detail(
      {this.discount,
      this.photoUrl,
      this.productName,
      this.price,
      this.featuresTitle,
      this.features});
}

List<Detail> productssDetail = [
  // iMac
  Detail(
    discount: 'New',
    photoUrl: 'assets/images/mac/iMac.jpg',
    productName: '24 Inc iMac',
    price: 1699,
    featuresTitle: 'iMac 24 inc 4.5K M1 8CPU 7GPU 8GB 256GB Gri MJV83TU/A',
    features:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra quis augue fermentum convallis. Morbi rutrum, diam a placerat fermentum, lectus nibh porttitor sapien, ut feugiat magna nisl id risus. Ut a dolor condimentum, pulvinar mi vel, vehicula felis. Cras sollicitudin elementum tristique. Morbi quis efficitur felis. Proin eget sollicitudin augue. In nec urna rhoncus, placerat nisl vitae, placerat nulla. Integer condimentum mauris quis risus ultrices, non aliquam nibh luctus. Integer et accumsan arcu. Nulla in elit interdum, pharetra arcu at, faucibus sem.',
  ),
  Detail(
    discount: '-10%',
    photoUrl: 'assets/images/mac/mac_mini.jpg',
    productName: 'Mac Mini',
    price: 699,
    featuresTitle: 'Mac mini M1 8CPU 8GPU 16GB 1TB Gümüş Z12P000EG',
    features:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra quis augue fermentum convallis. Morbi rutrum, diam a placerat fermentum, lectus nibh porttitor sapien, ut feugiat magna nisl id risus. Ut a dolor condimentum, pulvinar mi vel, vehicula felis. Cras sollicitudin elementum tristique. Morbi quis efficitur felis. Proin eget sollicitudin augue. In nec urna rhoncus, placerat nisl vitae, placerat nulla. Integer condimentum mauris quis risus ultrices, non aliquam nibh luctus. Integer et accumsan arcu. Nulla in elit interdum, pharetra arcu at, faucibus sem.',
  ),
  Detail(
    discount: '-20%',
    photoUrl: 'assets/images/mac/air_m1.jpg',
    productName: 'Macbook Air M1',
    price: 999,
    featuresTitle:
        'MacBook Air 13.3 inc M1 8CPU 7GPU 8GB 256GB Uzay Grisi MGN63TU/A',
    features:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra quis augue fermentum convallis. Morbi rutrum, diam a placerat fermentum, lectus nibh porttitor sapien, ut feugiat magna nisl id risus. Ut a dolor condimentum, pulvinar mi vel, vehicula felis. Cras sollicitudin elementum tristique. Morbi quis efficitur felis. Proin eget sollicitudin augue. In nec urna rhoncus, placerat nisl vitae, placerat nulla. Integer condimentum mauris quis risus ultrices, non aliquam nibh luctus. Integer et accumsan arcu. Nulla in elit interdum, pharetra arcu at, faucibus sem.',
  ),
  Detail(
    discount: '-20%',
    photoUrl: 'assets/images/mac/macbook_pro.jpg',
    productName: 'Macbook Air M2',
    price: 1199,
    featuresTitle:
        'MacBook Air 13.6 inc M2 8CPU 8GPU 256GB Yıldız Işığı MLY13TU/A',
    features:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra quis augue fermentum convallis. Morbi rutrum, diam a placerat fermentum, lectus nibh porttitor sapien, ut feugiat magna nisl id risus. Ut a dolor condimentum, pulvinar mi vel, vehicula felis. Cras sollicitudin elementum tristique. Morbi quis efficitur felis. Proin eget sollicitudin augue. In nec urna rhoncus, placerat nisl vitae, placerat nulla. Integer condimentum mauris quis risus ultrices, non aliquam nibh luctus. Integer et accumsan arcu. Nulla in elit interdum, pharetra arcu at, faucibus sem.',
  ),
  Detail(
    discount: 'New',
    photoUrl: 'assets/images/mac/air_m2.jpg',
    productName: 'Macbook Air M2',
    price: 1999,
    featuresTitle:
        'MacBook Air M2 8C Cpu 10C Gpu 512GB Ssd 13.6 Gece Yarısı Dizüstü Bilgisayar MLY43TU/A',
    features:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra quis augue fermentum convallis. Morbi rutrum, diam a placerat fermentum, lectus nibh porttitor sapien, ut feugiat magna nisl id risus. Ut a dolor condimentum, pulvinar mi vel, vehicula felis. Cras sollicitudin elementum tristique. Morbi quis efficitur felis. Proin eget sollicitudin augue. In nec urna rhoncus, placerat nisl vitae, placerat nulla. Integer condimentum mauris quis risus ultrices, non aliquam nibh luctus. Integer et accumsan arcu. Nulla in elit interdum, pharetra arcu at, faucibus sem.',
  ),
  Detail(
    discount: 'New',
    photoUrl: 'assets/images/mac/pro.jpg',
    productName: 'Macbook Pro 15',
    price: 2899,
    featuresTitle:
        'Apple MacBook Pro M1 Pro Çip 10C 512GB SSD 16" Uzay Grisi Dizüstü Bilgisayar MK183TU/A',
    features:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra quis augue fermentum convallis. Morbi rutrum, diam a placerat fermentum, lectus nibh porttitor sapien, ut feugiat magna nisl id risus. Ut a dolor condimentum, pulvinar mi vel, vehicula felis. Cras sollicitudin elementum tristique. Morbi quis efficitur felis. Proin eget sollicitudin augue. In nec urna rhoncus, placerat nisl vitae, placerat nulla. Integer condimentum mauris quis risus ultrices, non aliquam nibh luctus. Integer et accumsan arcu. Nulla in elit interdum, pharetra arcu at, faucibus sem.',
  ),
  Detail(
    discount: '-10%',
    photoUrl: 'assets/images/mac/pro2.jpg',
    productName: 'Macbook Pro 13\"',
    price: 2499,
    featuresTitle:
        'MacBook Pro 13.3 inc M1 8CPU 8GPU 8GB 256GB Uzay Grisi MYD82TU/A',
    features:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra quis augue fermentum convallis. Morbi rutrum, diam a placerat fermentum, lectus nibh porttitor sapien, ut feugiat magna nisl id risus. Ut a dolor condimentum, pulvinar mi vel, vehicula felis. Cras sollicitudin elementum tristique. Morbi quis efficitur felis. Proin eget sollicitudin augue. In nec urna rhoncus, placerat nisl vitae, placerat nulla. Integer condimentum mauris quis risus ultrices, non aliquam nibh luctus. Integer et accumsan arcu. Nulla in elit interdum, pharetra arcu at, faucibus sem.',
  ),
  Detail(
    discount: '-10%',
    photoUrl: 'assets/images/mac/pro2.jpg',
    productName: 'Macbook Pro 16\"',
    price: 2499,
    featuresTitle:
        'MacBook Pro 16 inc M1 Max 10CPU 32GPU 64GB 4TB Uzay Grisi Z14X000BA',
    features:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra quis augue fermentum convallis. Morbi rutrum, diam a placerat fermentum, lectus nibh porttitor sapien, ut feugiat magna nisl id risus. Ut a dolor condimentum, pulvinar mi vel, vehicula felis. Cras sollicitudin elementum tristique. Morbi quis efficitur felis. Proin eget sollicitudin augue. In nec urna rhoncus, placerat nisl vitae, placerat nulla. Integer condimentum mauris quis risus ultrices, non aliquam nibh luctus. Integer et accumsan arcu. Nulla in elit interdum, pharetra arcu at, faucibus sem.',
  ),

  // iPhone
  Detail(
    discount: '-10%',
    photoUrl: 'assets/images/iphone/ipohe_12_pro_max.jpg',
    productName: 'iPhone 12 Pro',
    price: 999,
    featuresTitle: 'iPhone 12 Pro 128 Mavi MGJ83TU/A',
    features:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra quis augue fermentum convallis. Morbi rutrum, diam a placerat fermentum, lectus nibh porttitor sapien, ut feugiat magna nisl id risus. Ut a dolor condimentum, pulvinar mi vel, vehicula felis. Cras sollicitudin elementum tristique. Morbi quis efficitur felis. Proin eget sollicitudin augue. In nec urna rhoncus, placerat nisl vitae, placerat nulla. Integer condimentum mauris quis risus ultrices, non aliquam nibh luctus. Integer et accumsan arcu. Nulla in elit interdum, pharetra arcu at, faucibus sem.',
  ),
  Detail(
    discount: '-10%',
    photoUrl: 'assets/images/iphone/12.jpg',
    productName: 'iPhone 12',
    price: 699,
    featuresTitle: 'iPhone 12 64GB Yeşil ',
    features:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra quis augue fermentum convallis. Morbi rutrum, diam a placerat fermentum, lectus nibh porttitor sapien, ut feugiat magna nisl id risus. Ut a dolor condimentum, pulvinar mi vel, vehicula felis. Cras sollicitudin elementum tristique. Morbi quis efficitur felis. Proin eget sollicitudin augue. In nec urna rhoncus, placerat nisl vitae, placerat nulla. Integer condimentum mauris quis risus ultrices, non aliquam nibh luctus. Integer et accumsan arcu. Nulla in elit interdum, pharetra arcu at, faucibus sem.',
  ),
  Detail(
    discount: '-10%',
    photoUrl: 'assets/images/iphone/se.jpg',
    productName: 'iPhone SE',
    price: 429,
    featuresTitle: 'iPhone SE 64GB Mavi ',
    features:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra quis augue fermentum convallis. Morbi rutrum, diam a placerat fermentum, lectus nibh porttitor sapien, ut feugiat magna nisl id risus. Ut a dolor condimentum, pulvinar mi vel, vehicula felis. Cras sollicitudin elementum tristique. Morbi quis efficitur felis. Proin eget sollicitudin augue. In nec urna rhoncus, placerat nisl vitae, placerat nulla. Integer condimentum mauris quis risus ultrices, non aliquam nibh luctus. Integer et accumsan arcu. Nulla in elit interdum, pharetra arcu at, faucibus sem.',
  ),
  Detail(
    discount: '-20%',
    photoUrl: 'assets/images/iphone/13_pro.jpg',
    productName: 'iPhone 13 Pro',
    price: 1099,
    featuresTitle: 'iPhone 13 Pro 128GB Grafit MLV93TU/A',
    features:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra quis augue fermentum convallis. Morbi rutrum, diam a placerat fermentum, lectus nibh porttitor sapien, ut feugiat magna nisl id risus. Ut a dolor condimentum, pulvinar mi vel, vehicula felis. Cras sollicitudin elementum tristique. Morbi quis efficitur felis. Proin eget sollicitudin augue. In nec urna rhoncus, placerat nisl vitae, placerat nulla. Integer condimentum mauris quis risus ultrices, non aliquam nibh luctus. Integer et accumsan arcu. Nulla in elit interdum, pharetra arcu at, faucibus sem.',
  ),
  Detail(
    discount: '-10%',
    photoUrl: 'assets/images/iphone/13.jpg',
    productName: 'iPhone 13',
    price: 799,
    featuresTitle: 'iPhone 13 128GB Yıldız Işığı MLPG3TU/A',
    features:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra quis augue fermentum convallis. Morbi rutrum, diam a placerat fermentum, lectus nibh porttitor sapien, ut feugiat magna nisl id risus. Ut a dolor condimentum, pulvinar mi vel, vehicula felis. Cras sollicitudin elementum tristique. Morbi quis efficitur felis. Proin eget sollicitudin augue. In nec urna rhoncus, placerat nisl vitae, placerat nulla. Integer condimentum mauris quis risus ultrices, non aliquam nibh luctus. Integer et accumsan arcu. Nulla in elit interdum, pharetra arcu at, faucibus sem.',
  ),

  // iPad
  Detail(
    discount: '-10%',
    photoUrl: 'assets/images/ipad/ipad_pro.jpg',
    productName: 'iPad Pro',
    price: 1099,
    featuresTitle: 'iPad Pro 11 inç Wi‑Fi 128GB Uzay Grisi MHQR3TU/A',
    features:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra quis augue fermentum convallis. Morbi rutrum, diam a placerat fermentum, lectus nibh porttitor sapien, ut feugiat magna nisl id risus. Ut a dolor condimentum, pulvinar mi vel, vehicula felis. Cras sollicitudin elementum tristique. Morbi quis efficitur felis. Proin eget sollicitudin augue. In nec urna rhoncus, placerat nisl vitae, placerat nulla. Integer condimentum mauris quis risus ultrices, non aliquam nibh luctus. Integer et accumsan arcu. Nulla in elit interdum, pharetra arcu at, faucibus sem.',
  ),
  Detail(
    discount: '-10%',
    photoUrl: 'assets/images/ipad/air.jpg',
    productName: 'iPad Air',
    price: 599,
    featuresTitle: 'iPad Air 10.9 inç Wi-Fi 64GB Mavi MM9E3TU/A',
    features:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra quis augue fermentum convallis. Morbi rutrum, diam a placerat fermentum, lectus nibh porttitor sapien, ut feugiat magna nisl id risus. Ut a dolor condimentum, pulvinar mi vel, vehicula felis. Cras sollicitudin elementum tristique. Morbi quis efficitur felis. Proin eget sollicitudin augue. In nec urna rhoncus, placerat nisl vitae, placerat nulla. Integer condimentum mauris quis risus ultrices, non aliquam nibh luctus. Integer et accumsan arcu. Nulla in elit interdum, pharetra arcu at, faucibus sem.',
  ),
  Detail(
    discount: '-10%',
    photoUrl: 'assets/images/ipad/mini.jpg',
    productName: 'iPad Mini',
    price: 499,
    featuresTitle: 'iPad mini 8.3 inç Wi-Fi + Cellular 256GB Mor MK8K3TU/A',
    features:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra quis augue fermentum convallis. Morbi rutrum, diam a placerat fermentum, lectus nibh porttitor sapien, ut feugiat magna nisl id risus. Ut a dolor condimentum, pulvinar mi vel, vehicula felis. Cras sollicitudin elementum tristique. Morbi quis efficitur felis. Proin eget sollicitudin augue. In nec urna rhoncus, placerat nisl vitae, placerat nulla. Integer condimentum mauris quis risus ultrices, non aliquam nibh luctus. Integer et accumsan arcu. Nulla in elit interdum, pharetra arcu at, faucibus sem.',
  ),

  // Watch
  Detail(
    discount: 'New',
    photoUrl: 'assets/images/watch/w7.jpg',
    productName: 'Apple Watch 7',
    price: 699,
    featuresTitle:
        'Apple Watch Series 7 GPS 41mm Mavi Alüminyum Kasa - Koyu Abis Spor Kordon MKN13TU/A',
    features:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra quis augue fermentum convallis. Morbi rutrum, diam a placerat fermentum, lectus nibh porttitor sapien, ut feugiat magna nisl id risus. Ut a dolor condimentum, pulvinar mi vel, vehicula felis. Cras sollicitudin elementum tristique. Morbi quis efficitur felis. Proin eget sollicitudin augue. In nec urna rhoncus, placerat nisl vitae, placerat nulla. Integer condimentum mauris quis risus ultrices, non aliquam nibh luctus. Integer et accumsan arcu. Nulla in elit interdum, pharetra arcu at, faucibus sem.',
  ),
  Detail(
    discount: '-10%',
    photoUrl: 'assets/images/watch/w3.jpg',
    productName: 'Apple Watch 3',
    price: 299,
    featuresTitle:
        'Apple Watch Series 3 GPS 42mm Gümüş Alüminyum Kasa - Beyaz Spor Kordon MTF22TU/A',
    features:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra quis augue fermentum convallis. Morbi rutrum, diam a placerat fermentum, lectus nibh porttitor sapien, ut feugiat magna nisl id risus. Ut a dolor condimentum, pulvinar mi vel, vehicula felis. Cras sollicitudin elementum tristique. Morbi quis efficitur felis. Proin eget sollicitudin augue. In nec urna rhoncus, placerat nisl vitae, placerat nulla. Integer condimentum mauris quis risus ultrices, non aliquam nibh luctus. Integer et accumsan arcu. Nulla in elit interdum, pharetra arcu at, faucibus sem.',
  ),

  // AirPods
  Detail(
    discount: '-10%',
    photoUrl: 'assets/images/airpods/airpods3.jpg',
    productName: 'AirPods 3',
    price: 299,
    featuresTitle: 'AirPods ve Şarj Kutusu 3.Nesil MME73TU/A',
    features:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra quis augue fermentum convallis. Morbi rutrum, diam a placerat fermentum, lectus nibh porttitor sapien, ut feugiat magna nisl id risus. Ut a dolor condimentum, pulvinar mi vel, vehicula felis. Cras sollicitudin elementum tristique. Morbi quis efficitur felis. Proin eget sollicitudin augue. In nec urna rhoncus, placerat nisl vitae, placerat nulla. Integer condimentum mauris quis risus ultrices, non aliquam nibh luctus. Integer et accumsan arcu. Nulla in elit interdum, pharetra arcu at, faucibus sem.',
  ),
  Detail(
    discount: '-30%',
    photoUrl: 'assets/images/airpods/airpods_max.jpg',
    productName: 'AirPods Max',
    price: 699,
    featuresTitle: 'AirPods Max Gök Mavisi MGYL3TU/A',
    features:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra quis augue fermentum convallis. Morbi rutrum, diam a placerat fermentum, lectus nibh porttitor sapien, ut feugiat magna nisl id risus. Ut a dolor condimentum, pulvinar mi vel, vehicula felis. Cras sollicitudin elementum tristique. Morbi quis efficitur felis. Proin eget sollicitudin augue. In nec urna rhoncus, placerat nisl vitae, placerat nulla. Integer condimentum mauris quis risus ultrices, non aliquam nibh luctus. Integer et accumsan arcu. Nulla in elit interdum, pharetra arcu at, faucibus sem.',
  ),

  // Accessories
  Detail(
    discount: '-10%',
    photoUrl: 'assets/images/airTag.jpg',
    productName: 'AirTag',
    price: 99,
    featuresTitle: 'AirTag Tekli Paket MX532TU/A',
    features:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra quis augue fermentum convallis. Morbi rutrum, diam a placerat fermentum, lectus nibh porttitor sapien, ut feugiat magna nisl id risus. Ut a dolor condimentum, pulvinar mi vel, vehicula felis. Cras sollicitudin elementum tristique. Morbi quis efficitur felis. Proin eget sollicitudin augue. In nec urna rhoncus, placerat nisl vitae, placerat nulla. Integer condimentum mauris quis risus ultrices, non aliquam nibh luctus. Integer et accumsan arcu. Nulla in elit interdum, pharetra arcu at, faucibus sem.',
  ),
  Detail(
    discount: '-10%',
    photoUrl: 'assets/images/airtag_loop.jpg',
    productName: 'AirTag Loop',
    price: 59,
    featuresTitle: 'AirTag Loop Ayçiçeği MK0W3ZM/A',
    features:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras viverra quis augue fermentum convallis. Morbi rutrum, diam a placerat fermentum, lectus nibh porttitor sapien, ut feugiat magna nisl id risus. Ut a dolor condimentum, pulvinar mi vel, vehicula felis. Cras sollicitudin elementum tristique. Morbi quis efficitur felis. Proin eget sollicitudin augue. In nec urna rhoncus, placerat nisl vitae, placerat nulla. Integer condimentum mauris quis risus ultrices, non aliquam nibh luctus. Integer et accumsan arcu. Nulla in elit interdum, pharetra arcu at, faucibus sem.',
  ),
];
