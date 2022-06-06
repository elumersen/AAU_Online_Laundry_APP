// import 'package:proj/Models/order.dart';
// import 'package:proj/data_providers/localDataBaseHelper.dart';
// import 'package:proj/data_providers/orderDataProvider/orderDataProvider.dart';
// import 'package:sqflite/sqflite.dart';

// class OrderLocalDataProvider extends OrderDataProvider{
//   static final table1Name = "cloth";
//   static final table2Name = 'user';
//   static final table3Name = "order";
//   Database? db ;


//   OrderLocalDataProvider(){
//   }

//     Future<Database?> get database async{
//       if(db !=null){
//         return await db;
//       }else{
//         return  await initDB();
//       }
//     }

//     Future<Database?> initDB()async {
//     return await openDatabase(await getDatabasesPath()+"laundary",
//     onCreate: (db,version)async{
//        return await db.execute('''
//         CREATE TABLE $table3Name (orderId TEXT PRIMARY KEY,userId TEXT,clothes TEXT, price REAL)
//       ''');
//     },
//     version: 1
//     );
//   }
//   @override
//   Future<void> deleteOrder(String id) {

//     // TODO: implement deleteOrder
//     throw UnimplementedError();
//   }

//   @override
//   Future<Order?> getOrder(String id) {
//     // TODO: implement getOrder
//     throw UnimplementedError();
//   }

//   @override
//   Future<Order?> makeOrder(Order order) {
//     // TODO: implement makeOrder
//     throw UnimplementedError();
//   }

//   @override
//   Future<Order?> updateOrder(String id, Order order) {
//     // TODO: implement updateOrder
//     throw UnimplementedError();
//   }

//   @override
//   Future<List<Order>?>getAllOrder() {
//     // TODO: implement getAllOrder
//     throw UnimplementedError();
//   }
  
// }