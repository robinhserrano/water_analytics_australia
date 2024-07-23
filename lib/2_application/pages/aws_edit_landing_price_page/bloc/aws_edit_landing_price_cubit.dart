import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/aws_landing_price_model.dart';
part 'aws_edit_landing_price_state.dart';

class AwsEditLandingPriceCubit extends Cubit<AwsEditLandingPriceCubitState> {
  AwsEditLandingPriceCubit({
    // required this.firestoreService,
    required this.repo,
  }) : super(const AwsEditLandingPriceStateLoading()) {
    // fetchLandingPrices();
  }

  // final FirebaseFirestoreService firestoreService;
  final Repository repo;

  Future<void> fetchLandingPriceById(String id) async {
    emit(const AwsEditLandingPriceStateLoading());
    try {
      final landingPrice = await repo.fetchLandingPriceById(id);

      if (landingPrice != null) {
        emit(AwsEditLandingPriceStateLoaded(landingPrice));
      } else {
        emit(const AwsEditLandingPriceStateError(message: 'CloudSales Failed'));
      }
    } catch (e) {
      emit(AwsEditLandingPriceStateError(message: e.toString()));
    }
  }

  // Future<bool> updateLandingPrice(AwsLandingPrice landingPrices) async {
  //   try {
  //     await repo.updateLandingPrice(LandingPrice);

  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  Future<bool> updateLandingPrice(
    String internalReference,
    String name,
    String productCategory,
    double installationService,
    double supplyOnly,
    // DateTime recordedAt,
  ) async {
    //emit(const AwsLandingPriceStateLoading());
    try {
      final success = await repo.updateLandingPrice(
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

  // Future<bool> updatePassword(int LandingPriceId, String password) async {
  //   try {
  //     await repo.updateLandingPricePassword(LandingPriceId, password);

  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }
}
