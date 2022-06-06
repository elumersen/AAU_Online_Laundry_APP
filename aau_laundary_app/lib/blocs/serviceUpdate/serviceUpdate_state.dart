import '../../models/cloth.dart';

abstract class ServiceUpdateState {}

class ServiceUpdateItemsLoading extends ServiceUpdateState {}

class ServiceUpdateItemsLoaded extends ServiceUpdateState {
  List<Cloth> clothUpdates;
  ServiceUpdateItemsLoaded({required this.clothUpdates});
}

class ServiceUpdateError extends ServiceUpdateState {
  String error;
  ServiceUpdateError({required this.error});
}
class NoExistingCloth extends ServiceUpdateState{
  
}
class ServiceUpdateSuccessful extends ServiceUpdateState {}
