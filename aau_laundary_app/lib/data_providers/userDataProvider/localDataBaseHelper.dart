
// import 'dart:async';

// import 'package:sqflite/sqflite.dart';

// class LocalDataBaseHelper{

//   static final table1Name = "cloth";
//   static final table2Name = 'user';
//   static final table3Name = "order";
//   // static final 
 
//   LocalDataBaseHelper._private();
//   static final LocalDataBaseHelper instance = LocalDataBaseHelper._private();

//   static Database? db;

//   Future<Database> get database async{
//     return db ??= await initDB();
//   }  

//   Future<Database> initDB()async {
//     return await openDatabase(await getDatabasesPath()+"laundary.db",
//     onCreate: (db,version)async{
//       await db.execute('''
//         CREATE TABLE $table1Name (name TEXT PRIMARY KEY,price REAL)
//       ''');
//         await db.execute('''
//         CREATE TABLE $table2Name (userId TEXT PRIMARY KEY,username TEXT,phone_number TEXT, password TEXT, role TEXT)
//       ''');
//         await db.execute('''
//         CREATE TABLE $table3Name (orderId TEXT PRIMARY KEY,userId TEXT,clothes TEXT, price REAL)
//       ''');
//       return null;
//     },
//     version: 1
//     );
//   }

// }

// var dd = LocalDataBaseHelper.instance()