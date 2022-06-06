import 'package:aau_laundary_app/data_providers/clothDataProvider/clothDataProvider.dart';

import '../models/models.dart';
import 'package:http/http.dart' as http;

class ClothRepository {
  ClothDataProvider clothDataProvider;
  ClothRepository({required this.clothDataProvider});

  Future<Cloth?> createCloth(Cloth cloth) async {
    try {
      return await clothDataProvider.createCloth(cloth);
    } catch (error) {
      return null;
    }
  }

  Future<bool> deleteCloth(String name) async {
    try {
      var response = await clothDataProvider.deleteCloth(name);
      print('stiling living');
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<Cloth?> getACloth(String name) async {
    try {
      return await clothDataProvider.getACloth(name);
    } catch (error) {
      return null;
    }
  }

  Future<List<Cloth>?> getAllCloth({http.Client? client}) async {
    try {
      return await clothDataProvider.getAllCloth();
    } catch (error) {
      print("error in get all cloth");
      return null;
    }
  }

  Future<bool?> updateCloth(String name, Cloth cloth) async {
    try {
      return await clothDataProvider.updateCloth(name, cloth);
    } catch (error) {
      return false;
    }
  }
}
