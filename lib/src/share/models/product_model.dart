class ProductModel {
  int? id;
  String name;
  double price;
  double stock;
  String description;

  ProductModel({
    this.id,
    required this.name,
    required this.price,
    required this.stock,
    required this.description,
  });

  factory ProductModel.fromSQLite(Map map) => ProductModel(
        id: map['ID'],
        name: map['NOME'],
        price: map['PRECO'].toDouble() ?? 0.0,
        stock: map['ESTOQUE'].toDouble() ?? 0.0,
        description: map['DESCRICAO'],
      );

  static List<ProductModel> fromSQLiteList(List list) => list.map((e) => ProductModel.fromSQLite(e)).toList();

  List toSQLiteList() => [
        id,
        name,
        price,
        stock,
        description,
      ];

  List toSQLiteInsert() => [
        name,
        price,
        stock,
        description,
      ];

  List toSQLiteListUpdate() => [
        name,
        price,
        stock,
        description,
        id,
      ];

  factory ProductModel.empty() => ProductModel(
        id: null,
        name: '',
        price: 0,
        stock: 0,
        description: '',
      );
}
