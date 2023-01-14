class PaymentMethod {
  int? id;
  String name;

  PaymentMethod({this.id, required this.name});

  factory PaymentMethod.fromSQLite(Map map) => PaymentMethod(
        id: map['ID'],
        name: map['NOME'],
      );

  static List<PaymentMethod> fromSQLiteList(List list) => list.map((e) => PaymentMethod.fromSQLite(e)).toList();

  List toSQLiteInsert() => [
        name,
      ];
}
