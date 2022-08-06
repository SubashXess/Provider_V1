import 'package:provider_v1/Models/favorite_list_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Future<Database> initializeDatabase() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'favorites.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  static Future _onCreate(Database db, int version) async {
    const sql =
        '''CREATE TABLE favorites(id INTEGER PRIMARY KEY, image TEXT, title TEXT)''';
    await db.execute(sql);
  }

  static Future<int> createFavorites(FavoriteListModel favorite) async {
    Database db = await DBHelper.initializeDatabase();
    return await db.insert('favorites', favorite.toMap());
  }

  static Future<List<FavoriteListModel>> getFavorites() async {
    Database db = await DBHelper.initializeDatabase();
    var favorite = await db.query('favorites', orderBy: 'id');
    List<FavoriteListModel> favoriteList = favorite.isNotEmpty
        ? favorite.map((details) => FavoriteListModel.fromMap(details)).toList()
        : [];
    return favoriteList;
  }

  static Future<int> updateFavorites(FavoriteListModel favorite) async {
    Database db = await DBHelper.initializeDatabase();
    return await db.update('favorites', favorite.toMap(),
        where: 'id = ?', whereArgs: [favorite.id]);
  }

  static Future<int> deleteFavorites(int id) async {
    Database db = await DBHelper.initializeDatabase();
    return await db.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }
}
