class PurchaseProductModel {
  int? id_product;
  int? id_purchase;
  int? quantity;
  double? price;

  PurchaseProductModel({this.id_product, this.id_purchase, this.quantity, this.price});

  static List<PurchaseProductModel> fromSQLiteList(List<Map> list) {
    print("List: ${list.map((e) => PurchaseProductModel.fromSQLite(e)).toList()}");
    return list.map((e) => PurchaseProductModel.fromSQLite(e)).toList();
  }

  static PurchaseProductModel fromSQLite(Map map) {
    print("INTERNO: ${map['ID_PRODUTO']} - ${map['ID_COMPRA']} - ${map['QUANTIDADE']} - ${map['VALOR']}");
    return PurchaseProductModel(
      id_product: map['ID_PRODUTO'] ?? 1,
      id_purchase: map['ID_COMPRA'] ?? 1,
      price: map['VALOR'].toDouble() ?? 0.0,
      quantity: map['QUANTIDADE'].toDouble() ?? 0.0,
    );
  }

  List toSQLiteInsert() => [
        id_purchase,
        id_product,
        price,
        quantity,
      ];

  List toSQLiteUpdate() => [
        id_purchase,
        id_product,
        price,
        quantity,
      ];

  factory PurchaseProductModel.empty() => PurchaseProductModel(
        id_product: null,
        id_purchase: null,
        price: null,
        quantity: null,
      );
}
