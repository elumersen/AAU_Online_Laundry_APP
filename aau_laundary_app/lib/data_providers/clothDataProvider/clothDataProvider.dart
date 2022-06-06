// import 'package:proj/Models/cloth.dart';
import 'package:aau_laundary_app/models/cloth.dart';

abstract class ClothDataProvider {
  Future<Cloth?> getACloth(String name);

  Future<Cloth?> createCloth(Cloth cloth);

  Future<bool?> updateCloth(String name, Cloth cloth);

  Future<bool> deleteCloth(String name);
  Future<List<Cloth>> getAllCloth();
}
