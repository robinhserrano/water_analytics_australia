import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/firebase_repository.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_user_model.dart';
part 'create_users_state.dart';

class CreateUsersCubit extends Cubit<CreateUsersCubitState> {
  CreateUsersCubit({
    required this.firestoreService,
    required this.repo, 
  }) : super(const CreateUsersStateLoading()) {
    // fetchUsers();
  }

  final FirebaseFirestoreService firestoreService;
  final Repository repo;

  // Future<void> fetchUserById(String id) async {
  //   emit(const CreateUsersStateLoading());
  //   try {
  //     final users = await firestoreService.getUserById(id);

  //     if (users != null) {
  //       emit(CreateUsersStateLoaded(users));
  //     } else {
  //       emit(const CreateUsersStateError(message: 'CloudSales Failed'));
  //     }
  //   } catch (e) {
  //     emit(CreateUsersStateError(message: e.toString()));
  //   }
  // }

  // Future<bool> registerUserWithEmailAndPassword(
  //   String email,
  //   String password,
  // ) async {
  //   try {
  //     //  await firestoreService.updateUserById(user);
  //     var hehe = FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(email: email, password: password);

  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  Future<bool> createUser(CloudUser user) async {
    try {
      await firestoreService.updateUserById(user);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> createAwsUser(AwsUser user) async {
    try {
      final success = await repo.createUser(user);

      return success;
    } catch (e) {
      return false;
    }
  }

  Future<UserCredential?> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return null;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return null;
      } else {
        print(e.message);
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
