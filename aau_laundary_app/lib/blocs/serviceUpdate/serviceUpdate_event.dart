import '../../models/cloth.dart';

abstract class ServiceUpdateEvent {}

class LoadServiceUpdateItems extends ServiceUpdateEvent {}

class UpdateCloth extends ServiceUpdateEvent {
  List<Cloth> clothes;
  UpdateCloth({required this.clothes});
}

class AddCloth extends ServiceUpdateEvent {
  Cloth cloth;
  AddCloth({required this.cloth});
}

class RemoveCloth extends ServiceUpdateEvent {
  String name;
  RemoveCloth({required this.name});
}
