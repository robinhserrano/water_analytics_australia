import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/firebase_repository.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_user_model.dart';
part 'my_team_state.dart';

class MyTeamCubit extends Cubit<MyTeamCubitState> {
  MyTeamCubit({
    required this.repo,
  }) : super(const MyTeamStateLoading()) {
    fetchUsers();
  }

  // final FirebaseFirestoreService firestoreService;
  final Repository repo;

  Future<void> fetchUsers() async {
    emit(const MyTeamStateLoading());
    try {
      final users = await repo.fetchUsers();

      if (users != null) {
        emit(MyTeamStateLoaded(users));
      } else {
        emit(const MyTeamStateError(message: 'CloudSales Failed'));
      }
    } catch (e) {
      emit(MyTeamStateError(message: e.toString()));
    }
  }

  // Future<bool> saveCloudSales(CloudSalesOrder sale) async {
  //   try {
  //     await firestoreService.saveCloudSales(sale);

  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }
}
