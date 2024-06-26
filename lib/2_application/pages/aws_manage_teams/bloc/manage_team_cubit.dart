import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';
import 'package:water_analytics_australia/core/hive_helper.dart';
part 'manage_team_state.dart';

class ManageTeamsCubit extends Cubit<ManageTeamsCubitState> {
  ManageTeamsCubit({
    required this.repo,
  }) : super(const ManageTeamsStateLoading()) {
    fetchUsers();
  }
  
  final Repository repo;

  Future<void> fetchUsers() async {
    emit(const ManageTeamsStateLoading());
    try {
      final user = await HiveHelper.getCurrentUser();

      final users = await repo.fetchUsers();
      if (users != null) {
        var filteredUsers = <AwsUser>[];
        if ((user?.accessLevel ?? 1) >= 2) {
          final salesTeamManager = users
              .where(
                (e) => e.salesManagerId == user?.userId && e.accessLevel == 2,
              )
              .toList();

          final managers = [
            ...salesTeamManager.map((e) => e.id),
            (user?.userId ?? 0),
          ];

          final salesPerson = users
              .where(
                (e) => managers.contains(e.salesManagerId),
              )
              .toList();

          filteredUsers = [...salesTeamManager, ...salesPerson];
        }

        emit(ManageTeamsStateLoaded(filteredUsers.toSet().toList()));
      } else {
        emit(const ManageTeamsStateError(message: 'CloudSales Failed'));
      }
    } catch (e) {
      emit(ManageTeamsStateError(message: e.toString()));
    }
  }
}
