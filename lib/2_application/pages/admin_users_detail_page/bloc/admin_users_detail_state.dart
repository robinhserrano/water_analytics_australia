part of 'admin_users_detail_cubit.dart';

abstract class AdminUsersDetailCubitState extends Equatable {
  const AdminUsersDetailCubitState();

  @override
  List<Object> get props => [];
}

class AdminUsersDetailInitial extends AdminUsersDetailCubitState {
  const AdminUsersDetailInitial();
}

class AdminUsersDetailStateLoading extends AdminUsersDetailCubitState {
  const AdminUsersDetailStateLoading();
}

class AdminUsersDetailStateLoaded extends AdminUsersDetailCubitState {
  const AdminUsersDetailStateLoaded(this.user);
  final CloudUser user;

  @override
  List<Object> get props => [];
}

class AdminUsersDetailStateError extends AdminUsersDetailCubitState {
  const AdminUsersDetailStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
