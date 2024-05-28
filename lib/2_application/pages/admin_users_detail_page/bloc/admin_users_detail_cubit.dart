import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/firebase_repository.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_user_model.dart';
part 'admin_users_detail_state.dart';

class AdminUsersDetailCubit extends Cubit<AdminUsersDetailCubitState> {
  AdminUsersDetailCubit({
    required this.firestoreService,
  }) : super(const AdminUsersDetailStateLoading()) {
   // fetchUsers();
  }

  final FirebaseFirestoreService firestoreService;

  Future<void> fetchUserById(String id) async {
    emit(const AdminUsersDetailStateLoading());
    try {
      final users = await firestoreService.getUserById( id);

      if (users != null) {
        emit(AdminUsersDetailStateLoaded(users));
      } else {
        emit(const AdminUsersDetailStateError(message: 'CloudSales Failed'));
      }
    } catch (e) {
      emit(AdminUsersDetailStateError(message: e.toString()));
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
