class Product {
  //Product variables
  final String name;
  final double price;
  final String imageUrl;

  //Product constructor
  const Product(
      {required this.name, required this.price, required this.imageUrl});

  //Product fromJson
  static const List<Product> products = [
    Product(
        name: 'Chesterfield sofa',
        price: 100.00,
        imageUrl: 'Asset/Images/product4.jpg'),
    Product(
        name: 'Kvlatresna Sofa',
        price: 250.00,
        imageUrl: 'Asset/Images/product5.jpg'),
    Product(
        name: 'Tuxedo sofa',
        price: 550.00,
        imageUrl: 'Asset/Images/product6.jpg'),
    Product(
        name: 'Kvlatresna Sofa',
        price: 250.00,
        imageUrl: 'Asset/Images/product1.jpg'),
    Product(
        name: 'Kvlatresna Sofa',
        price: 250.00,
        imageUrl: 'Asset/Images/product2.jpg'),
    Product(
        name: 'Kvlatresna Sofa',
        price: 250.00,
        imageUrl: 'Asset/Images/product3.jpg'),
    // Product(
    //     name: 'iPhone 12 Mini',
    //     price: 699,
    //     imageUrl:
    //         'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-12-pro-family-hero?wid=940&hei=1112&fmt=png-alpha&.v=1604021660000'),
    // Product(
    //     name: 'iPhone 11',
    //     price: 599,
    //     imageUrl:
    //         'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-12-pro-family-hero?wid=940&hei=1112&fmt=png-alpha&.v=1604021660000'),
    // Product(
    //     name: 'iPhone 11 Pro',
    //     price: 699,
    //     imageUrl:
    //         'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-12-pro-family-hero?wid=940&hei=1112&fmt=png-alpha&.v=1604021660000'),
    // Product(
    //     name: 'iPhone 11 Pro Max',
    //     price: 799,
    //     imageUrl:
    //         'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-12-pro-family-hero?wid=940&hei=1112&fmt=png-alpha&.v='),
  ];
}
