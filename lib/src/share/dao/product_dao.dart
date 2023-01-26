import 'package:flutter_sqflite_windows/src/share/dao/sql.dart';
import 'package:flutter_sqflite_windows/src/share/models/product_model.dart';
import 'package:flutter_sqflite_windows/src/share/models/sale_product_model.dart';
import '../services/connection_sqlite_service.dart';
import 'package:sqflite/sqflite.dart';

class ProductDao{
  final ConnectionSQLiteService _connection = ConnectionSQLiteService.instance;

  Future<Database> _getDatabase() async => await _connection.db;

  Future<ProductModel> insert(ProductModel product) async {
    try {
      Database db = await _getDatabase();
      int id = await db.rawInsert(ConnectionSQL.addProduct(), product.toSQLiteInsert());
      product.id = id;
      return product;
    } catch (error) {
      throw Exception();
    }
  }

  Future<bool> update(ProductModel product) async {
    try {
      Database db = await _getDatabase();
      int result = await db.rawUpdate(ConnectionSQL.updateProduct(), product.toSQLiteListUpdate());
      return result > 0;
    } catch (error) {
      throw Exception();
    }
  }

  Future<List<ProductModel>> selectAll() async {
    try {
      Database db = await _getDatabase();
      List<Map> result = await db.rawQuery(ConnectionSQL.selectAllProduct());
      return ProductModel.fromSQLiteList(result);
    } catch (error) {
      throw Exception();
    }
  }

  Future<bool> delete(ProductModel product) async {
    try {
      Database db = await _getDatabase();
      int result = await db.rawDelete(ConnectionSQL.deleteProduct(), [product.id]);
      return result > 0;
    } catch (error) {
      throw Exception();
    }
  }

  Future<List<SaleProductModel>> getProductFromSale(int idSale) async {
    try {
      Database db = await _getDatabase();
      List<Map> result = await db.rawQuery(ConnectionSQL.selectSaleProductById(), [idSale]);
      return SaleProductModel.fromSQLiteList(result);
    } catch (error) {
      throw Exception();
    }
  }
}