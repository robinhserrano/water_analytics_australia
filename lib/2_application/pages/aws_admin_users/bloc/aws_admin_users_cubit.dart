import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/firebase_repository.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_user_model.dart';
part 'aws_admin_users_state.dart';

class AwsAdminUsersCubit extends Cubit<AwsAdminUsersCubitState> {
  AwsAdminUsersCubit({
    required this.firestoreService,
    required this.repo,
  }) : super(const AwsAdminUsersStateLoading()) {
    fetchUsers();
  }

  final FirebaseFirestoreService firestoreService;
  final Repository repo;

  Future<void> fetchUsers() async {
    emit(const AwsAdminUsersStateLoading());
    try {
      final users = await repo.fetchUsers();

      if (users != null) {
        emit(AwsAdminUsersStateLoaded(users));
      } else {
        emit(const AwsAdminUsersStateError(message: 'CloudSales Failed'));
      }
    } catch (e) {
      emit(AwsAdminUsersStateError(message: e.toString()));
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
