import 'dart:convert';
// import 'package:proj/Models/cloth.dart';
// import 'package:proj/data_providers/clothDataProvider/clothDataProvider.dart';
import 'package:aau_laundary_app/data_providers/clothDataProvider/clothDataProvider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cloth.dart';

class ClothRemoteDataProvider extends ClothDataProvider {
  String baseUrl = "http://127.0.0.1:5500/cloth";

  Future get getAccessToken async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("accessToken")) {
      return prefs.getString("accessToken");
    } else {
      throw new Exception("No token Found in Shared Preferences");
    }
  }

  @override
  Future<Cloth?> getACloth(String name) async {
    var url = Uri.parse(baseUrl + "/$name");
    var accessToken = await getAccessToken;
    try {
      var response = await http
          .get(url, headers: {"Authorization": "Beared $accessToken"});
      if (response.statusCode == 200) {
        dynamic clothJson = jsonDecode(response.body);
        Cloth cloth = Cloth.fromJson(clothJson);
        var cloth_list = clothJson.map((cloth) {
          return Cloth.fromJson(cloth);
        }).toList();

        return cloth;
      } else {
        throw Exception("Error has occurred");
      }
    } catch (error) {
      throw Exception("json data not found ");
      // return Exception();

    }
  }

  @override
  Future<bool> deleteCloth(String name) async {
    try {
      var accessToken = await getAccessToken;
      var response = await http.delete(Uri.parse(baseUrl + "/$name"), headers: {
        "Authorization": "Beared $accessToken",
        "Content-Type": "application/json"
      });

      if (response.statusCode < 300 && response.statusCode > 199) {
        jsonDecode(response.body);
        return true;
      } else {
        throw Exception("Error has occured in delete cloth");
      }
    } catch (error) {
      throw Exception("Error has been found in delete cloth data provider");
    }
  }

  @override
  Future<bool?> updateCloth(String name, Cloth cloth) async {
    try {
      var accessToken = await getAccessToken;
      var response = await http.put(Uri.parse(baseUrl + "/$name"),
          headers: {
            "Authorization": "Beared $accessToken",
            "Content-Type": "application/json",
          },
          body: jsonEncode(<String, dynamic>{
            "name": cloth.name,
            "price": cloth.price,
          }));
      if (response.statusCode == 200) {
        true;
      } else {
        throw false;
      }
    } catch (error) {
      throw Exception("Error has occurred");
    }
  }

  @override
  Future<Cloth?> createCloth(Cloth cloth) async {
    try {
      var accessToken = await getAccessToken;
      var response = await http.post(Uri.parse(baseUrl),
          headers: {
            "Authorization": "Beared $accessToken",
            "Content-Type": "application/json",
          },
          body: jsonEncode(<String, String>{
            "name": cloth.name,
            "price": cloth.price.toString(),
          }));
      if (response.statusCode == 201) {
        var clothJson = jsonDecode(response.body);
        var cloth = Cloth.fromJson(clothJson);
        return cloth;
        // if(response.sta)
      } else {
        throw Exception(response.body);
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<List<Cloth>> getAllCloth() async {
    var url = Uri.parse(baseUrl);
    try {
      var accessToken = await getAccessToken;
      var response = await http
          .get(url, headers: {"Authorization": "Beared $accessToken"});
          print("------------------------------");
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        dynamic clothJson = jsonDecode(response.body);
        List<dynamic> clothes = clothJson["clothes"];
        // print("in getl all resonse body after --------");
        // print(clothJson);
        List<Cloth> cloth_list =
            clothes.map((cloth) => Cloth.fromJson(cloth)).toList();
        // print("-------------------------------------");
        // for (int i = 0; i < cloth_list.length; i++) {
        //   print(cloth_list[i].name);
        print("in getl all resonse body after --------");
        // }
        return cloth_list;
      } else {
        throw Exception("List element is not found");
      }
    } catch (error) {
      print(error);
      throw Exception("");

      // return Exception();

    }
  }
}
