import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/aws_sales_record_model.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';
part 'member_detail_state.dart';

class MemberDetailCubit extends Cubit<MemberDetailCubitState> {
  MemberDetailCubit({
    required this.reps,
    required this.repo,
  }) : super(const MemberDetailStateLoading()) {
    fetchSalesByReps();
  }

  final List<String> reps;
  final Repository repo;

  Future<void> fetchSalesByReps() async {
    emit(const MemberDetailStateLoading());
    try {
      final users = await repo.fetchSalesByReps(reps);

      if (users != null) {
        emit(MemberDetailStateLoaded(users));
      } else {
        emit(const MemberDetailStateError(message: 'CloudSales Failed'));
      }
    } catch (e) {
      emit(MemberDetailStateError(message: e.toString()));
    }
  }

  Future<bool> updateUser(AwsUser user) async {
    try {
      await repo.updateUser(user);

      return true;
    } catch (e) {
      return false;
    }
  }
}
