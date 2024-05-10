import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:water_analytics_australia/0_data/data/hive/user_hive_model.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit({required this.repo}) : super(const LoginStateLoading());

  final Repository repo;

  Future<void> login(String dbName, String username, String password) async {
    emit(const LoginStateLoading());
    try {
      final data = await repo.login(dbName, username, password);

      if (data != null) {
        final user = UserHive(
          data.dbName,
          data.id,
          data.isSystem,
          data.partnerId,
          data.userId,
          data.userLogin,
          data.userName,
          data.userTz,
          password,
        );

        final userBox = Hive.box<UserHive>('user');

        await userBox.add(user);

        emit(const LoginStateSuccess());
      } else {
        emit(const LoginStateError(message: 'Login Failed'));
      }
    } catch (e) {
      emit(LoginStateError(message: e.toString()));
    }
  }
}
