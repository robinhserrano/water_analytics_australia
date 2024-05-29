import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/firebase_repository.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_user_model.dart';
part 'create_users_state.dart';

class CreateUsersCubit extends Cubit<CreateUsersCubitState> {
  CreateUsersCubit({
    required this.firestoreService,
  }) : super(const CreateUsersStateLoading()) {
    // fetchUsers();
  }

  final FirebaseFirestoreService firestoreService;

  Future<void> fetchUserById(String id) async {
    emit(const CreateUsersStateLoading());
    try {
      final users = await firestoreService.getUserById(id);

      if (users != null) {
        emit(CreateUsersStateLoaded(users));
      } else {
        emit(const CreateUsersStateError(message: 'CloudSales Failed'));
      }
    } catch (e) {
      emit(CreateUsersStateError(message: e.toString()));
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
