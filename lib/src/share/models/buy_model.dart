class BuyModel {
  int? id;
  int idProductBuy;
  int idProvider;
  int idPaymentMethod;
  double price;
  DateTime date;

  BuyModel({
    this.id,
    required this.idProductBuy,
    required this.idProvider,
    required this.idPaymentMethod,
    required this.price,
    required this.date,
  });

  factory BuyModel.fromSQLite(Map map) => BuyModel(
    id: map['ID'],
    idProductBuy: map['ID_COMPRA_PRODUTO'],
    idProvider: map['ID_FORNECEDOR'],
    idPaymentMethod: map['ID_FORMA_PAGAMENTO'],
    price: map['VALOR_TOTAL'],
    date: DateTime.parse(map['DATA']),
  );

  static List<BuyModel> fromSQLiteList(List list) => list.map((e) => BuyModel.fromSQLite(e)).toList();

  List toSQLiteInsert() => [
    idProductBuy,
    idProvider,
    idPaymentMethod,
    price,
    date.toString(),
  ];

  List toSQLiteUpdate() => [
    idProductBuy,
    idProvider,
    idPaymentMethod,
    price,
    date.toString(),
    id,
  ];

  factory BuyModel.empty() => BuyModel(
    id: null,
    idProductBuy: 0,
    idProvider: 0,
    idPaymentMethod: 0,
    price: 0,
    date: DateTime.now(),
  );

}
