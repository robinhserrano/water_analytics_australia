part of 'manage_team_detail_cubit.dart';

abstract class ManageTeamDetailCubitState extends Equatable {
  const ManageTeamDetailCubitState();

  @override
  List<Object> get props => [];
}

class ManageTeamDetailInitial extends ManageTeamDetailCubitState {
  const ManageTeamDetailInitial();
}

class ManageTeamDetailStateLoading extends ManageTeamDetailCubitState {
  const ManageTeamDetailStateLoading();
}

class ManageTeamDetailStateLoaded extends ManageTeamDetailCubitState {
  const ManageTeamDetailStateLoaded(this.team);
  final List<AwsUser> team;

  @override
  List<Object> get props => [];
}

class ManageTeamDetailStateError extends ManageTeamDetailCubitState {
  const ManageTeamDetailStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
