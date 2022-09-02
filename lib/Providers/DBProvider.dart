import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Crypto table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'crypto_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {}, onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Crypto(cryptoData TEXT)');
    });
  }

  // Insert CryptoModel on database
  createCrypto(List newCrypto) async {
    await deleteAllCryptos();
    final db = await database;
    final res = await db?.insert('Crypto', {'cryptoData': jsonEncode(newCrypto)});
    return res;
  }

  // Delete all
  Future<int?> deleteAllCryptos() async {
    final db = await database;
    final res = await db?.rawDelete('DELETE FROM Crypto');

    return res;
  }

  // To Get all the data
  Future<String?>? getAllCryptos() async {
    final db = await database;
    List<Map<String, Object?>>? res = await db?.rawQuery("SELECT * FROM Crypto");
    String response = (res != null && res.length != 0) ? res[0]['cryptoData'].toString() : '[]';

    return response;
  }
}
