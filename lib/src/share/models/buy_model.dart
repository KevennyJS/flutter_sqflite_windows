import 'package:flutter_sqflite_windows/src/share/dao/purchases_dao.dart';
import 'package:flutter_sqflite_windows/src/share/models/provider_model.dart';

import '../dao/provider_dao.dart';
import '../entity/googlescript_purchase_entity.dart';

class PurchaseModel {
  int? id;
  int idProvider;
  int idPaymentMethod;
  double price;
  DateTime date;

  PurchaseModel({
    this.id,
    required this.idProvider,
    required this.idPaymentMethod,
    required this.price,
    required this.date,
  });

  factory PurchaseModel.fromSQLite(Map map) => PurchaseModel(
        id: map['ID'],
        idProvider: map['ID_FORNECEDOR'],
        idPaymentMethod: map['ID_FORMA_PAGAMENTO'],
        price: map['VALOR_TOTAL'].toDouble() ?? 0.0,
        date: DateTime.tryParse(map['DATA'])?? DateTime.now(),
      );

  static List<PurchaseModel> fromSQLiteList(List list) => list.map((e) => PurchaseModel.fromSQLite(e)).toList();

  List toSQLiteInsert() => [
        idProvider,
        idPaymentMethod,
        price,
        date.toString(),
      ];

  List toSQLiteUpdate() => [
        idProvider,
        idPaymentMethod,
        price,
        date.toString(),
        id,
      ];

  factory PurchaseModel.empty() => PurchaseModel(
        id: null,
        idProvider: 0,
        idPaymentMethod: 0,
        price: 0,
        date: DateTime.now(),
      );
}
