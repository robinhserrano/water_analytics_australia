part of 'my_team_cubit.dart';

abstract class MyTeamCubitState extends Equatable {
  const MyTeamCubitState();

  @override
  List<Object> get props => [];
}

class MyTeamInitial extends MyTeamCubitState {
  const MyTeamInitial();
}

class MyTeamStateLoading extends MyTeamCubitState {
  const MyTeamStateLoading();
}

class MyTeamStateLoaded extends MyTeamCubitState {
  const MyTeamStateLoaded(this.users);
  final List<AwsUser> users;

  @override
  List<Object> get props => [];
}

class MyTeamStateError extends MyTeamCubitState {
  const MyTeamStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
