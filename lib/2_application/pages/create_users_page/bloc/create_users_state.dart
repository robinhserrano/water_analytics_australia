part of 'create_users_cubit.dart';

abstract class CreateUsersCubitState extends Equatable {
  const CreateUsersCubitState();

  @override
  List<Object> get props => [];
}

class CreateUsersInitial extends CreateUsersCubitState {
  const CreateUsersInitial();
}

class CreateUsersStateLoading extends CreateUsersCubitState {
  const CreateUsersStateLoading();
}

class CreateUsersStateLoaded extends CreateUsersCubitState {
  const CreateUsersStateLoaded(this.user);
  final CloudUser user;

  @override
  List<Object> get props => [];
}

class CreateUsersStateError extends CreateUsersCubitState {
  const CreateUsersStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
