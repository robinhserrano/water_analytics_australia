part of 'admin_users_cubit.dart';

abstract class AdminUsersCubitState extends Equatable {
  const AdminUsersCubitState();

  @override
  List<Object> get props => [];
}

class AdminUsersInitial extends AdminUsersCubitState {
  const AdminUsersInitial();
}

class AdminUsersStateLoading extends AdminUsersCubitState {
  const AdminUsersStateLoading();
}

class AdminUsersStateLoaded extends AdminUsersCubitState {
  const AdminUsersStateLoaded(this.users);
  final List<CloudUser> users;

  @override
  List<Object> get props => [];
}

class AdminUsersStateError extends AdminUsersCubitState {
  const AdminUsersStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
