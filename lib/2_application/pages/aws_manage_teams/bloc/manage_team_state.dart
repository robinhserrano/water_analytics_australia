part of 'manage_team_cubit.dart';

abstract class ManageTeamsCubitState extends Equatable {
  const ManageTeamsCubitState();

  @override
  List<Object> get props => [];
}

class ManageTeamsInitial extends ManageTeamsCubitState {
  const ManageTeamsInitial();
}

class ManageTeamsStateLoading extends ManageTeamsCubitState {
  const ManageTeamsStateLoading();
}

class ManageTeamsStateLoaded extends ManageTeamsCubitState {
  const ManageTeamsStateLoaded(this.users);
  final List<AwsUser> users;

  @override
  List<Object> get props => [];
}

class ManageTeamsStateError extends ManageTeamsCubitState {
  const ManageTeamsStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
