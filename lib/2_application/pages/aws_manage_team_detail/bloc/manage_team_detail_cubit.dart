// ignore_for_file: prefer_collection_literals

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';
import 'package:water_analytics_australia/core/hive_helper.dart';
part 'manage_team_detail_state.dart';

class ManageTeamDetailCubit extends Cubit<ManageTeamDetailCubitState> {
  ManageTeamDetailCubit({
    required this.repo,
    required this.managerId,
  }) : super(const ManageTeamDetailStateLoading()) {
    fetchUsers();
  }

  final Repository repo;
  final String managerId;

  Future<void> fetchUsers() async {
    emit(const ManageTeamDetailStateLoading());
    try {
      final user = await HiveHelper.getCurrentUser();

      final users = await repo.fetchUsers();
      if (users != null) {
        // var filteredUsers = <AwsUser>[];
        final salesManagers = users
            .where((e) => e.accessLevel == 3 && e.id == int.parse(managerId))
            .toList();
        final filteredTeams = <List<AwsUser>>[];
        for (final salesManager in salesManagers) {
          //lvl3
          final salesTeamManager = users
              .where(
                (e) =>
                    e.salesManagerId == salesManager.id && e.accessLevel == 2,
              )
              .toList();

          final managers = [
            salesManagers.first.id,
            ...salesTeamManager.map((e) => e.id),
            // (user?.userId ?? 0),
          ];

          final salesPerson = users
              .where(
                (e) => managers.contains(e.salesManagerId),
              )
              .toList();

          filteredTeams.add(
            [salesManagers.first, ...salesTeamManager, ...salesPerson]
                .toSet()
                .toList(),
          );
        }

        emit(ManageTeamDetailStateLoaded(filteredTeams.first));
      } else {
        emit(const ManageTeamDetailStateError(message: 'CloudSales Failed'));
      }
    } catch (e) {
      emit(ManageTeamDetailStateError(message: e.toString()));
    }
  }
}
