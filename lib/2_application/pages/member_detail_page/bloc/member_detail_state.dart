part of 'member_detail_cubit.dart';

abstract class MemberDetailCubitState extends Equatable {
  const MemberDetailCubitState();

  @override
  List<Object> get props => [];
}

class MemberDetailInitial extends MemberDetailCubitState {
  const MemberDetailInitial();
}

class MemberDetailStateLoading extends MemberDetailCubitState {
  const MemberDetailStateLoading();
}

class MemberDetailStateLoaded extends MemberDetailCubitState {
  const MemberDetailStateLoaded(this.records);
  final List<AwsSalesOrder> records;

  @override
  List<Object> get props => [];
}

class MemberDetailStateError extends MemberDetailCubitState {
  const MemberDetailStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
