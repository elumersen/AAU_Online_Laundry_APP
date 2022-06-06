import 'dart:async';

import 'package:aau_laundary_app/blocs/serviceUpdate/serviceUpdate_event.dart';
import 'package:aau_laundary_app/blocs/serviceUpdate/serviceUpdate_state.dart';
import 'package:aau_laundary_app/data_providers/clothDataProvider/clothRemoteDataProvider.dart';
import 'package:aau_laundary_app/repository/clothRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';
// import 'package:proj/Models/models.dart';
// import 'package:proj/blocs/adminBloc/admin_event.dart';
// import 'package:proj/blocs/adminBloc/admin_state.dart';
// import 'package:proj/blocs/serviceUpdate/serviceUpdate_event.dart';
// import 'package:proj/blocs/serviceUpdate/serviceUpdate_state.dart';
// import 'package:proj/data_providers/clothDataProvider/clothRemoteDataProvider.dart';
// import 'package:proj/repository/clothRepository.dart';

class ServiceUpdateBloc extends Bloc<ServiceUpdateEvent, ServiceUpdateState> {
  ClothRepository clothRepository =
      ClothRepository(clothDataProvider: ClothRemoteDataProvider());

  ServiceUpdateBloc() : super(ServiceUpdateItemsLoading()) {
    on<LoadServiceUpdateItems>(handleLoadServiceUpdateItems);
    on<UpdateCloth>(handleUpdateCloth);
    on<RemoveCloth>(handleRemoveCloth);
    on<AddCloth>(handleAddCloth);
  }

  FutureOr<void> handleLoadServiceUpdateItems(
      LoadServiceUpdateItems event, Emitter<ServiceUpdateState> emit) async {
    emit(ServiceUpdateItemsLoading());
    print("about loading");
    List<Cloth>? clothes = await clothRepository.getAllCloth();
    print(clothes);
    if(clothes==null){
      await clothRepository.createCloth(Cloth(name: "sample cloth type",price: 23));
    }
    print("below loading");
    if (clothes != null) {
      emit(ServiceUpdateItemsLoaded(clothUpdates: clothes));
    } else {
      emit(ServiceUpdateError(error: "Can't Load Data From Server"));
    }
  }

  FutureOr<void> handleUpdateCloth(
      UpdateCloth event, Emitter<ServiceUpdateState> emit) async {
    var state = this.state;
    emit(ServiceUpdateItemsLoading());
    if (state is ServiceUpdateItemsLoaded) {
      bool hasError = false;
      event.clothes.forEach((cloth) async {
        if (cloth.price != 0) {
          var response = await clothRepository.updateCloth(cloth.name, cloth);
          if (response == false) {
            hasError = true;
          }
        } else {
          cloth.price == 0;
          var response = await clothRepository.updateCloth(cloth.name, cloth);
          if (response == false) {
            hasError = true;
          }
        }
      });
      if (hasError) {
        emit(ServiceUpdateError(error: "Failled to Update Cloth. Try Again"));
      } else {
        emit(ServiceUpdateSuccessful());
        await Future.delayed(Duration(seconds: 1));
        emit(ServiceUpdateItemsLoaded(clothUpdates: state.clothUpdates));
      }
      // hasError ? emit(ServiceUpdateError()): emit(ServiceUpdateItemsLoaded(clothUpdates:state.clothUpdates));
    } else {
      emit(ServiceUpdateError(error: "Something Went Wrong Try Again"));
    }
  }

  FutureOr<void> handleRemoveCloth(
      RemoveCloth event, Emitter<ServiceUpdateState> emit) async {
    var response = await clothRepository.deleteCloth(event.name);
    if (response == true) {
      emit(ServiceUpdateSuccessful());
      await Future.delayed(Duration(seconds: 2));
      List<Cloth>? clothes = await clothRepository.getAllCloth();
      if (clothes != null) {
        emit(ServiceUpdateItemsLoaded(clothUpdates: clothes));
      } else {
        emit(ServiceUpdateError(error: "Something Went Wrong Try Again"));
      }
    } else {
      emit(ServiceUpdateError(
          error: "Cloth Not Removed. Name Doesn't Exist or Network Error"));
    }
  }

  FutureOr<void> handleAddCloth(
      AddCloth event, Emitter<ServiceUpdateState> emit) async {
    emit(ServiceUpdateItemsLoading());
    var response = clothRepository.createCloth(event.cloth);
    if (response == null) {
      emit(ServiceUpdateError(
          error: "Cloth Not Added. Name Already Exists or Netwrok Error"));
    } else {
      emit(ServiceUpdateSuccessful());
      await Future.delayed(Duration(seconds: 1));
      List<Cloth>? clothes = await clothRepository.getAllCloth();
      if (clothes != null) {
        emit(ServiceUpdateItemsLoaded(clothUpdates: clothes));
      } else {
        emit(ServiceUpdateError(error: "Network Error"));
      }
    }
  }
}
