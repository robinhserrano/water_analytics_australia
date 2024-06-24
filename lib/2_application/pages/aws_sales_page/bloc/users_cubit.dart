import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';
part 'users_state.dart';

class UsersCubit extends Cubit<UsersCubitState> {
  UsersCubit({
    required this.repo,
  }) : super(const UsersStateLoading()) {
    fetchAwsUsers();
  }

  final Repository repo;

  Future<void> fetchAwsUsers() async {
    try {
      final users = await repo.fetchUsers();

      emit(UsersStateLoaded(users ?? []));
    } catch (e) {
      emit(UsersStateError(message: e.toString()));
    }
  }
}
