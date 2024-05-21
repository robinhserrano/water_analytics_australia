import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/firebase_repository.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/landing_price_model.dart';
part 'landing_price_detail_state.dart';

class LandingPriceDetailCubit extends Cubit<LandingPriceDetailCubitState> {
  LandingPriceDetailCubit({required this.firestoreService})
      : super(const LandingPriceDetailStateLoading());

  final FirebaseFirestoreService firestoreService;

  Future<void> fetchLandingPriceDetails(String id) async {
    // final lastUploadDate = await firestoreService.getLastUploadedTime();
    emit(const LandingPriceDetailStateLoading());
    try {
      final data = await firestoreService.getLandingPrice(id);
      if (data != null) {
        emit(LandingPriceDetailStateLoaded(data));
      } else {
        emit(const LandingPriceDetailStateError(message: 'Sales Failed'));
      }
    } catch (e) {
      emit(LandingPriceDetailStateError(message: e.toString()));
    }
  }

  Future<void> saveLandingPriceDetails(LandingPrice landingPrice) async {
    // final lastUploadDate = await firestoreService.getLastUploadedTime();
    emit(const LandingPriceDetailStateLoading());
    try {
      final data = await firestoreService.saveLandingPrice(landingPrice);
      if (data) {
        var haha = data;
        print('trueeeeeeeeeeeeeeeeeeeeeeee');
        //emit(LandingPriceDetailStateLoaded(data));
      } else {
      //  emit(const LandingPriceDetailStateError(message: 'Sales Failed'));
      }
    } catch (e) {
    //  emit(LandingPriceDetailStateError(message: e.toString()));
    }
  }
}
