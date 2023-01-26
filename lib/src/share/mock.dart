import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dao/sql.dart';
import 'services/connection_sqlite_service.dart';

class Mock {
  final ConnectionSQLiteService _connection = ConnectionSQLiteService.instance;

  Future<Database> _getDatabase() async => await _connection.db;

  Future<void> clearMocks() async {
    Database db = await _getDatabase();
    int result = await db.rawDelete(ConnectionSQL.clearAllTables());
    if (result > 0) {
      debugPrint("limpas");
    }
  }

  Future<void> insertMocks() async {
    Database db = await _getDatabase();
    int result = await db.rawInsert(ConnectionSQL.populateClient());
    if (result > 0) debugPrint("Cliente populado");
    result = await db.rawInsert(ConnectionSQL.populatePaymentMethod());
    if (result > 0) debugPrint("Forma de pagamento populada");
    result = await db.rawInsert(ConnectionSQL.populateProduct());
    if (result > 0) debugPrint("Produto populado");
    result = await db.rawInsert(ConnectionSQL.populateProvider());
    if (result > 0) debugPrint("Fornecedor populado");
    result = await db.rawInsert(ConnectionSQL.populateSale());
    if (result > 0) debugPrint("Venda populada");
    result = await db.rawInsert(ConnectionSQL.populateSaleProduct());
    if (result > 0) debugPrint("Item de venda populado");
    result = await db.rawInsert(ConnectionSQL.populatePurchase());
    if (result > 0) debugPrint("Compra populada");
    result = await db.rawInsert(ConnectionSQL.populatePurchaseProduct());
    if (result > 0) debugPrint("Item de compra populado");

  }

}
