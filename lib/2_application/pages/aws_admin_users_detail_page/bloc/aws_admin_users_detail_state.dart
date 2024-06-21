part of 'aws_admin_users_detail_cubit.dart';

abstract class AwsAdminUsersDetailCubitState extends Equatable {
  const AwsAdminUsersDetailCubitState();

  @override
  List<Object> get props => [];
}

class AwsAdminUsersDetailInitial extends AwsAdminUsersDetailCubitState {
  const AwsAdminUsersDetailInitial();
}

class AwsAdminUsersDetailStateLoading extends AwsAdminUsersDetailCubitState {
  const AwsAdminUsersDetailStateLoading();
}

class AwsAdminUsersDetailStateLoaded extends AwsAdminUsersDetailCubitState {
  const AwsAdminUsersDetailStateLoaded(this.user);
  final AwsUser user;

  @override
  List<Object> get props => [];
}

class AwsAdminUsersDetailStateError extends AwsAdminUsersDetailCubitState {
  const AwsAdminUsersDetailStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
