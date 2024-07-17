// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:water_analytics_australia/0_data/firebase_repository.dart';
// import 'package:water_analytics_australia/1_domain/models/cloud_landing_price_model.dart';
// import 'package:water_analytics_australia/1_domain/models/landing_price_model.dart';
// part 'aws_landing_price_state.dart';

// class AwsLandingPriceCubit extends Cubit<AwsLandingPriceCubitState> {
//   AwsLandingPriceCubit({required this.firestoreService})
//       : super(const AwsLandingPriceStateLoading()) {
//     fetchAwsLandingPrices();
//   }

//   final FirebaseFirestoreService firestoreService;

//   Future<void> fetchAwsLandingPrices() async {
//     // final lastUploadDate = await firestoreService.getLastUploadedTime();
//     emit(const AwsLandingPriceStateLoading());
//     try {
//       final data = await firestoreService.getAwsLandingPrices();
//       if (data != null) {
//         emit(AwsLandingPriceStateLoaded(data.reversed.toList()));
//       } else {
//         emit(const AwsLandingPriceStateError(message: 'Sales Failed'));
//       }
//     } catch (e) {
//       emit(AwsLandingPriceStateError(message: e.toString()));
//     }
//   }
// }
