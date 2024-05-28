import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/firebase_repository.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_landing_price_model.dart';
part 'landing_price_state.dart';

class LandingPriceCubit extends Cubit<LandingPriceCubitState> {
  LandingPriceCubit({required this.firestoreService})
      : super(const LandingPriceStateLoading()) {
    fetchLandingPrices();
  }

  final FirebaseFirestoreService firestoreService;

  Future<void> fetchLandingPrices() async {
    // final lastUploadDate = await firestoreService.getLastUploadedTime();
    emit(const LandingPriceStateLoading());
    try {
      final data = await firestoreService.getLandingPrices();
      if (data != null) {
        emit(LandingPriceStateLoaded(data.reversed.toList()));
      } else {
        emit(const LandingPriceStateError(message: 'Sales Failed'));
      }
    } catch (e) {
      emit(LandingPriceStateError(message: e.toString()));
    }
  }
}
