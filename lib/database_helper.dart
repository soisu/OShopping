import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _db;

  DatabaseHelper._instance();

  String usersTable = 'users';
  String pantsTable = 'pants';
  String skirtTable = 'skirts';
  String topsTable = 'tops';
  String hotitemsTable = 'hotitems';
  String dressTable = 'dress';
  String localbrandTable = 'localbrand';

  String colId = 'id';
  String colEmail = 'email';
  String colPassword = 'password';
  
  String colName_pants = 'name_pants';
  String colBrand_pants = 'brand_pants';
  String colPrice_pants = 'price_pants';
  String colDescription_pants = 'description_pants';
  String colImagePath_pants = 'imagePath_pants';

  String colName_skirt = 'name_skirt';
  String colBrand_skirt = 'brand_skirt';
  String colPrice_skirt = 'price_skirt';
  String colDescription_skirt = 'description_skirt';
  String colImagePath_skirt = 'imagePath_skirt';

  String colName_tops = 'name_tops';
  String colBrand_tops = 'brand_tops';
  String colPrice_tops = 'price_tops';
  String colDescription_tops = 'description_tops';
  String colImagePath_tops = 'imagePath_tops';

  String colName_hotitems = 'name_hotitems';
  String colBrand_hotitems = 'brand_hotitems';
  String colPrice_hotitems = 'price_hotitems';
  String colDescription_hotitems = 'description_hotitems';
  String colImagePath_hotitems = 'imagePath_hotitems';

  String colName_dress = 'name_dress';
  String colBrand_dress = 'brand_dress';
  String colPrice_dress = 'price_dress';
  String colDescription_dress = 'description_dress';
  String colImagePath_dress = 'imagePath_dress';

  String colName_localbrand = 'name_localbrand';
  String colBrand_localbrand = 'brand_localbrand';
  String colPrice_localbrand = 'price_localbrand';
  String colDescription_localbrand = 'description_localbrand';
  String colImagePath_localbrand = 'imagePath_localbrand';

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    final dbDir = await getDatabasesPath();
    final dbPath = join(dbDir, 'users.db');
    print('Database path: $dbPath'); 

    final userDb = await openDatabase(
      dbPath,
      version: 1,
      onCreate: _createDb,
    );
    return userDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $usersTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colEmail TEXT UNIQUE, $colPassword TEXT)',
    );
    await db.execute(
      'CREATE TABLE $pantsTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName_pants TEXT, $colBrand_pants TEXT, $colPrice_pants REAL, $colDescription_pants TEXT, $colImagePath_pants TEXT)',
    );
    await db.execute(
      'CREATE TABLE $skirtTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName_skirt TEXT, $colBrand_skirt TEXT, $colPrice_skirt REAL, $colDescription_skirt TEXT, $colImagePath_skirt TEXT)',
    );
    await db.execute(
      'CREATE TABLE $topsTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName_tops TEXT, $colBrand_tops TEXT, $colPrice_tops REAL, $colDescription_tops TEXT, $colImagePath_tops TEXT)',
    );
    await db.execute(
      'CREATE TABLE $hotitemsTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName_hotitems TEXT, $colBrand_hotitems TEXT, $colPrice_hotitems REAL, $colDescription_hotitems TEXT, $colImagePath_hotitems TEXT)',
    );
    await db.execute(
      'CREATE TABLE $dressTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName_dress TEXT, $colBrand_dress TEXT, $colPrice_dress REAL, $colDescription_dress TEXT, $colImagePath_dress TEXT)',
    );
    await db.execute(
      'CREATE TABLE $localbrandTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName_localbrand TEXT, $colBrand_localbrand TEXT, $colPrice_localbrand REAL, $colDescription_localbrand TEXT, $colImagePath_localbrand TEXT)',
    );
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    Database? db = await this.db;
    final int result = await db!.insert(usersTable, user);
    return result;
  }

  Future<Map<String, dynamic>?> getUser(String email, String password) async {
    Database? db = await this.db;
    final List<Map<String, dynamic>> result = await db!.query(
      usersTable,
      where: '$colEmail = ? AND $colPassword = ?',
      whereArgs: [email, password],
    );
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<int> insertPant(Map<String, dynamic> brand_pants) async {
    Database? db = await this.db;
    return await db!.insert(pantsTable, brand_pants);
  }

  Future<List<Map<String, dynamic>>> getPant() async {
    Database? db = await this.db;
    return await db!.query(pantsTable);
  }

  Future<int> deletePant(int id) async {
    Database? db = await this.db;
    return await db!.delete(pantsTable, where: '$colId = ?', whereArgs: [id]);
  }//pants

  Future<int> insertSkirt(Map<String, dynamic> brand_skirt) async {
    Database? db = await this.db;
    return await db!.insert(skirtTable, brand_skirt);
  }

  Future<List<Map<String, dynamic>>> getSkirt() async {
    Database? db = await this.db;
    return await db!.query(skirtTable);
  }

  Future<int> deleteSkirt(int id) async {
    Database? db = await this.db;
    return await db!.delete(skirtTable, where: '$colId = ?', whereArgs: [id]);
  }//skirt

  Future<int> insertTops(Map<String, dynamic> brand_tops) async {
    Database? db = await this.db;
    return await db!.insert(topsTable, brand_tops);
  }

  Future<List<Map<String, dynamic>>> getTops() async {
    Database? db = await this.db;
    return await db!.query(topsTable);
  }

  Future<int> deleteTops(int id) async {
    Database? db = await this.db;
    return await db!.delete(topsTable, where: '$colId = ?', whereArgs: [id]);
  }//tops

  Future<int> insertHotitems(Map<String, dynamic> brand_hotitems) async {
    Database? db = await this.db;
    return await db!.insert(hotitemsTable, brand_hotitems);
  }

  Future<List<Map<String, dynamic>>> getHotitems() async {
    Database? db = await this.db;
    return await db!.query(hotitemsTable);
  }

  Future<int> deleteHotitems(int id) async {
    Database? db = await this.db;
    return await db!.delete(hotitemsTable, where: '$colId = ?', whereArgs: [id]);
  }//hotitems

  Future<int> insertDress(Map<String, dynamic> brand_dress) async {
    Database? db = await this.db;
    return await db!.insert(dressTable, brand_dress);
  }

  Future<List<Map<String, dynamic>>> getDress() async {
    Database? db = await this.db;
    return await db!.query(dressTable);
  }

  Future<int> deleteDress(int id) async {
    Database? db = await this.db;
    return await db!.delete(dressTable, where: '$colId = ?', whereArgs: [id]);
  }//dress

  Future<int> insertLocalbrand(Map<String, dynamic> brand_localbrand) async {
    Database? db = await this.db;
    return await db!.insert(localbrandTable, brand_localbrand);
  }

  Future<List<Map<String, dynamic>>> getLocalbrand() async {
    Database? db = await this.db;
    return await db!.query(localbrandTable);
  }

  Future<int> deleteLocalbrand(int id) async {
    Database? db = await this.db;
    return await db!.delete(localbrandTable, where: '$colId = ?', whereArgs: [id]);
  }//localbrand


}
