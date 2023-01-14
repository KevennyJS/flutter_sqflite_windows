import 'package:flutter_sqflite_windows/src/share/models/provider_model.dart';
import '../services/connection_sqlite_service.dart';
import 'package:sqflite/sqflite.dart';
import 'sql.dart';

class ProviderDao{
  final ConnectionSQLiteService _connection = ConnectionSQLiteService.instance;

  Future<Database> _getDatabase() async => await _connection.db;

  Future<ProviderModel> insert(ProviderModel provider) async {
    try {
      Database db = await _getDatabase();
      int id = await db.rawInsert(ConnectionSQL.addProvider(), provider.toSQLiteInsert());
      provider.id = id;
      return provider;
    } catch (error) {
      throw Exception();
    }
  }

  Future<bool> update(ProviderModel provider) async {
    try {
      Database db = await _getDatabase();
      int result = await db.rawUpdate(ConnectionSQL.updateProvider(), provider.toSQLiteListUpdate());
      return result > 0;
    } catch (error) {
      throw Exception();
    }
  }
}