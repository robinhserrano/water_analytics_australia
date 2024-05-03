part of 'login_cubit.dart';

abstract class LoginCubitState extends Equatable {
  const LoginCubitState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginCubitState {
  const LoginInitial();
}

class LoginStateLoading extends LoginCubitState {
  const LoginStateLoading();
}

class LoginStateSuccess extends LoginCubitState {
  const LoginStateSuccess();

  @override
  List<Object> get props => [];
}

class LoginStateError extends LoginCubitState {
  const LoginStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
