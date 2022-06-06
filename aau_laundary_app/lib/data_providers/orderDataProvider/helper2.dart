// import 'package:proj/Models/order.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqlite_api.dart';

// class OrderLocalDataProviderHelper{
//   static Database? _db;

//   Future<Database?> get db async{
//     if(_db!=null){
//       return _db;
//     }
//     else{
//       var result =  await openDatabase(await getDatabasesPath()+"laundary.db",
//       onCreate: (db,version){
//         db.execute('''
//         CREATE TABLE order (orderId TEXT PRIMARY KEY,userId TEXT,clothes TEXT, price REAL)
//         ''');
     
//       },
//       version: 1
//       );
//          return result;
//     }
//   }

//   createOrder(Order order)async{
//     var database = await db;
//     print(order.toMap());
//     await database!.execute("CREATE TABLE IF NOT EXISTS Ofrder( orderId TEXT PRIMARY KEY,userId TEXT,clothes TEXT, price REAL)");
//     var response = await database!.insert("Ofrder", order.toMap());
//     print("insert out put of operations");
//     print(response);
//   }
//   getOrder(String orderid)async{
//     var database = await db;
//     var result = await database!.query("user",where:"orderId = ?",whereArgs: [orderid] );
//     print("with in the get method of the order sql table");
//     print(result);
//   }
// }