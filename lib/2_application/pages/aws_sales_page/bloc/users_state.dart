part of 'users_cubit.dart';

abstract class UsersCubitState extends Equatable {
  const UsersCubitState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersCubitState {
  const UsersInitial();
}

class UsersStateLoading extends UsersCubitState {
  const UsersStateLoading();
}

class UsersStateLoaded extends UsersCubitState {
  const UsersStateLoaded(this.users);
  final List<AwsUser> users;

  @override
  List<Object> get props => [];
}

class UsersStateError extends UsersCubitState {
  const UsersStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
