class Product {
  int? id;
  String name;
  double price;
  double quantity;
  String description;

  Product({
    this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.description,
  });

  factory Product.fromSQLite(Map map)=> Product(
    id: map['id'],
    name: map['nome'],
    price: map['preco'],
    quantity: map['quantidade'],
    description: map['descricao'],
  );

  static List<Product> fromSQLiteList(List list) => list.map((e) => Product.fromSQLite(e)).toList();

  List toSQLiteList()=> [
    id,
    name,
    price,
    quantity,
    description,
  ];
}