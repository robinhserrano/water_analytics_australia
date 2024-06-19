import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/firebase_repository.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_user_model.dart';
part 'aws_admin_users_detail_state.dart';

class AwsAdminUsersDetailCubit extends Cubit<AwsAdminUsersDetailCubitState> {
  AwsAdminUsersDetailCubit({
    required this.firestoreService,
  }) : super(const AwsAdminUsersDetailStateLoading()) {
    // fetchUsers();
  }

  final FirebaseFirestoreService firestoreService;

  Future<void> fetchUserById(String id) async {
    emit(const AwsAdminUsersDetailStateLoading());
    try {
      final users = await firestoreService.getUserById(id);

      if (users != null) {
        emit(AwsAdminUsersDetailStateLoaded(users));
      } else {
        emit(const AwsAdminUsersDetailStateError(message: 'CloudSales Failed'));
      }
    } catch (e) {
      emit(AwsAdminUsersDetailStateError(message: e.toString()));
    }
  }

  Future<bool> updateUser(CloudUser user) async {
    try {
      await firestoreService.updateUserById(user);

      return true;
    } catch (e) {
      return false;
    }
  }
}
