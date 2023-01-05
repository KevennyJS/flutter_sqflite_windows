import 'package:flutter_sqflite_windows/src/share/dao/sql.dart';
import 'package:flutter_sqflite_windows/src/share/models/client_model.dart';
import 'package:flutter_sqflite_windows/src/share/services/connection_sqlite_service.dart';
import 'package:sqflite/sqflite.dart';

class ClientDao {
  final ConnectionSQLiteService _connection = ConnectionSQLiteService.instance;

  Future<Database> _getDatabase() async => await _connection.db;

  Future<ClientModel> add(ClientModel client) async {
    try {
      Database db = await _getDatabase();
      int id = await db.rawInsert(ConnectionSQL.addClient(), client.toSQLiteList());
      client.id = id;
      return client;
    } catch (error) {
      throw Exception();
    }
  }

  Future<bool> update(ClientModel client) async {
    try {
      Database db = await _getDatabase();
      int result = await db.rawUpdate(ConnectionSQL.updateClient(), client.toSQLiteList());
      return result > 0;
    } catch (error) {
      throw Exception();
    }
  }

  Future<List<ClientModel>> selectAll() async {
    try {
      Database db = await _getDatabase();
      List<Map> result = await db.rawQuery(ConnectionSQL.selectAllClient());
      return ClientModel.fromSQLiteList(result);
    } catch (error) {
      throw Exception();
    }
  }

  Future<bool> delete() async {
    try {
      Database db = await _getDatabase();
      int result = await db.rawDelete(ConnectionSQL.deleteClient());
      return result > 0;
    } catch (error) {
      throw Exception();
    }
  }
}
