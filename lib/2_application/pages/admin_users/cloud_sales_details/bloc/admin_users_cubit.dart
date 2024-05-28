import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/firebase_repository.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_user_model.dart';
part 'admin_users_state.dart';

class AdminUsersCubit extends Cubit<AdminUsersCubitState> {
  AdminUsersCubit({
    required this.firestoreService,
  }) : super(const AdminUsersStateLoading()) {
    fetchUsers();
  }

  final FirebaseFirestoreService firestoreService;

  Future<void> fetchUsers() async {
    emit(const AdminUsersStateLoading());
    try {
      final users = await firestoreService.getUsers();

      if (users != null) {
        emit(AdminUsersStateLoaded(users));
      } else {
        emit(const AdminUsersStateError(message: 'CloudSales Failed'));
      }
    } catch (e) {
      emit(AdminUsersStateError(message: e.toString()));
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
