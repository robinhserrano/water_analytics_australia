part of 'aws_admin_users_cubit.dart';

abstract class AwsAdminUsersCubitState extends Equatable {
  const AwsAdminUsersCubitState();

  @override
  List<Object> get props => [];
}

class AwsAdminUsersInitial extends AwsAdminUsersCubitState {
  const AwsAdminUsersInitial();
}

class AwsAdminUsersStateLoading extends AwsAdminUsersCubitState {
  const AwsAdminUsersStateLoading();
}

class AwsAdminUsersStateLoaded extends AwsAdminUsersCubitState {
  const AwsAdminUsersStateLoaded(this.users);
  final List<AwsUser> users;

  @override
  List<Object> get props => [];
}

class AwsAdminUsersStateError extends AwsAdminUsersCubitState {
  const AwsAdminUsersStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
