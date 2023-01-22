import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../../share/dao/sql.dart';
import '../../share/services/connection_sqlite_service.dart';

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
  }

}
