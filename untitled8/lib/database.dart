import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'kisi.dart';
class Db {
  static Future<Database> veritabaniAc() async{
    var db = await databaseFactoryFfi.openDatabase("soz.db");
    await db.execute(
      "CREATE TABLE if not exists kisiler(id INTEGER PRIMARY KEY AUTOINCREMENT,  ad TEXT NOT NULL, soz TEXT NOT NULL)",
    );
    return db;

  }
  static Future<int> ekle(Kisi eklenecek) async {
    var db = await veritabaniAc();
    var result = db.insert("kisiler", eklenecek.toMap());
    return result;
  }

  static Future<void> sil(int id) async {
    var db = await veritabaniAc();
    db.delete("kisiler", where: "id=?", whereArgs: [id]);
  }

  static Future<int> update(Kisi kisi) async {
    var db = await veritabaniAc();
    return db.update("kisiler", kisi.toMap(),
        where: "id=?",
        whereArgs: [kisi.id],
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  static Future<List<Kisi>> getAll() async {
    var db = await veritabaniAc();
    var kayitlar = await db.query("kisiler");
    return kayitlar.map((e) => Kisi.fromMap(e)).toList();
  }
}

