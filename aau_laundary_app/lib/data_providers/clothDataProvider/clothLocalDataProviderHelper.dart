// import 'package:proj/Models/models.dart';
// import 'package:proj/Models/order.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqlite_api.dart';

// class ClothLocalDataProviderHelper{
//   static Database? _db;

//   Future<Database?> get db async{
//     if(_db!=null){
//       return _db;
//     }
//     else{
//       var result =  await openDatabase(await getDatabasesPath()+"laundary.db",
//       onCreate: (db,version){
//         db.execute('''
//         CREATE TABLE IF NOT EXISTS CLOTH (name TEXT PRIMARY KEY,price REAL)
//         ''');
     
//       },
//       version: 1
//       );
//          return result;
//     }
//   }

//   Future createCloth(Cloth cloth)async{
//     var database = await db;
//     print(cloth.toMap());
//     await database!.execute("CREATE TABLE IF NOT EXISTS CLOTH( name TEXT PRIMARY KEY,price REAL)");
//     var response = await database!.insert("CLOTH", cloth.toMap());
//     print("insert method of cloth  put of operations");
//     print(response);
//   }
//   Future getCloth(String clothName)async{
//     var database = await db;
//     var result = await database!.query("CLOTH",where:"name = ?",whereArgs: [clothName] );
//     print("with in the get method of the cloth sql table");
//     print(result);
//   }
// }