import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/aws_landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/landing_price_model.dart';
part 'aws_landing_price_state.dart';

class AwsLandingPriceCubit extends Cubit<AwsLandingPriceCubitState> {
  AwsLandingPriceCubit({required this.repo})
      : super(const AwsLandingPriceStateLoading()) {
    fetchAwsLandingPrices();
  }

  final Repository repo;

  Future<void> fetchAwsLandingPrices() async {
    // final lastUploadDate = await firestoreService.getLastUploadedTime();
    emit(const AwsLandingPriceStateLoading());
    try {
      final data = await repo.fetchLandingPrices();
      if (data != null) {
        emit(AwsLandingPriceStateLoaded(data));
      } else {
        emit(const AwsLandingPriceStateError(message: 'Sales Failed'));
      }
    } catch (e) {
      emit(AwsLandingPriceStateError(message: e.toString()));
    }
  }

  Future<bool> saveAwsLandingPrices(
    String internalReference,
    String name,
    String productCategory,
    double installationService,
    double supplyOnly,
    // DateTime recordedAt,
  ) async {
    //emit(const AwsLandingPriceStateLoading());
    try {
      final success = await repo.saveLandingPrice(
        internalReference,
        name,
        productCategory,
        installationService,
        supplyOnly,
        // recordedAt,
      );
      if (success) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
