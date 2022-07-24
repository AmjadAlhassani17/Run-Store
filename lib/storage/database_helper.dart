// ignore_for_file: unused_local_variable

import 'package:path/path.dart';
import 'package:runstore/featcher/model/cart_product_model.dart';
import 'package:runstore/utils/constants.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabase {
  static final CartDatabase instance = CartDatabase._init();
  static Database? _database;
  CartDatabase._init();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
      create table ${Constant.tableProduct} (
        ${Constant.id} INTEGER PRIMARY key, 
        ${Constant.title} text not null,
        ${Constant.price} INTEGER not null,
        ${Constant.description} text not null,
        ${Constant.image} text not null)
      ''');
        await db.execute('''
      create table ${Constant.fav} (
        ${Constant.id} INTEGER PRIMARY key) 
      ''');
      },
    );
  }

  create(CartProduct cartProduct, {required bool isFromFav}) async {
    var db = await database;
    print("Amjadddddddd");
    var help = await db?.insert(Constant.tableProduct, cartProduct.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    if (isFromFav) {
      var help2 = await db?.insert(Constant.fav, {Constant.id: cartProduct.id},
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<List<CartProduct>> getAllProduct() async {
    var db = await database;
    List<Map> maps = await db!.query(Constant.tableProduct);
    print(maps.toList());
    List<CartProduct> list = [];
    list = maps
        .map(
          (item) => CartProduct(
            id: item['id'],
            image: item['image'],
            title: item['title'],
            description: item['description'],
            price: item['price'],
          ),
        )
        .toList();

    return list;
  }

  Future<bool> getProductId(int productId) async {
    var db = await database;
    List<Map<String, Object?>>? maps = await db?.query(Constant.fav,
        where: '${Constant.id} = ?', whereArgs: [productId]);
    print("MSG_LENGHT getProductId in helper = ${maps?.length}");    
    return (maps?.length ?? 0) > 0;
  }

  update(CartProduct cartProduct) async {
    var db = await database;
    var help = await db?.update(Constant.tableProduct, cartProduct.toJson(),
        where: '${Constant.id} = ?', whereArgs: [cartProduct.id]);
    var help2 = await db?.update(Constant.fav, {Constant.id: cartProduct.id},
        where: '${Constant.id} = ?', whereArgs: [cartProduct.id]);
  }

  delete(int id) async {
    var db = await database;
    return await db?.delete(Constant.tableProduct, where: 'id = ?', whereArgs: [id]);
  }

  delete2(int id) async {
    var db = await database;
    return await db?.delete(Constant.fav, where: 'id = ?', whereArgs: [id]);
  }
}
