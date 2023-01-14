class Product {
  int? id;
  String name;
  double price;
  double stock;
  String description;

  Product({
    this.id,
    required this.name,
    required this.price,
    required this.stock,
    required this.description,
  });

  factory Product.fromSQLite(Map map)=> Product(
    id: map['ID'],
    name: map['NOME'],
    price: map['PRECO'],
    stock: map['ESTOQUE'],
    description: map['DESCRICAO'],
  );

  static List<Product> fromSQLiteList(List list) => list.map((e) => Product.fromSQLite(e)).toList();

  List toSQLiteList()=> [
    id,
    name,
    price,
    stock,
    description,
  ];
}