import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:water_analytics_australia/0_data/data/hive/user_hive_model.dart';
import 'package:water_analytics_australia/0_data/odoo_repository.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_user_model.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit({
    required this.odooRepo,
    required this.repo,
  }) : super(const LoginStateLoading());

  final OdooRepository odooRepo;
  final Repository repo;

  Future<void> login(String dbName, String username, String password) async {
    emit(const LoginStateLoading());
    try {
      final data = await odooRepo.login(dbName, username, password);

      if (data != null) {
        final user = UserHive(
          data.dbName,
          data.userLogin,
          data.userName,
          password,
          null,
          null,
          null,
          4,
          50,
          null,
        );

        final userBox = Hive.box<UserHive>('user');

        await userBox.add(user);

        emit(const LoginStateSuccess());
      } else {
        emit(const LoginStateError(message: 'Login Failed'));
      }
    } catch (e) {
      print(e);
      emit(LoginStateError(message: e.toString()));
    }
  }

  Future<void> loginWithEmail(String emailAddress, String password) async {
    emit(const LoginStateLoading());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      final docSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(emailAddress)
          .get();

      final cloudUser =
          docSnapshot.exists ? CloudUser.fromFirestore(docSnapshot) : null;

      var hehe = cloudUser;

      final accessToken = await repo.fetchAccessToken(emailAddress, password);

      if (cloudUser != null && credential.user != null) {
        final user = UserHive(
          null, //data.dbName,
          null, //data.userLogin,
          null, //data.userName,
          null, //password,
          credential.user?.displayName,
          emailAddress, //null,
          credential.user?.photoURL,
          cloudUser.accessLevel.toInt(),
          cloudUser.commissionSplit.toInt(),
          accessToken,
        );

        final userBox = Hive.box<UserHive>('user');

        await userBox.add(user);
        emit(const LoginStateSuccess());
      } else {
        emit(
          const LoginStateError(
            message: 'Login Failed',
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(const LoginStateError(message: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(
          const LoginStateError(
            message: 'Wrong password provided for that user.',
          ),
        );
      }
      emit(
        const LoginStateError(
          message: 'Login Failed',
        ),
      );
    } catch (e) {
      emit(
        const LoginStateError(
          message: 'Login Failed',
        ),
      );
    }
  }

  Future<void> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();

    try {
      var accessLevel = 1;
      // Trigger the Google Sign-In flow
      final googleUser = await googleSignIn.signIn();

      // Optional: Check if sign-in was successful
      if (googleUser != null) {
        // Obtain the authentication result (GoogleSignInAuthentication)
        final googleAuth = await googleUser.authentication;

        // Extract credentials (access token and ID token)
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final userRef = FirebaseFirestore.instance
            .collection('users')
            .doc(googleUser.email);
        final userDocSnapshot = await userRef.get();

        if (!userDocSnapshot.exists) {
          // User document doesn't exist, create it with extracted profile information
          final userData = {
            'displayName': googleUser.displayName,
            'email': googleUser.email,
            'photoUrl': googleUser.photoUrl,
            'accessLevel': accessLevel,
            'commissionSplit': 50,
            // Add other relevant user profile fields as needed (e.g., photoURL)
            // ...
          };
          await userRef.set(userData);

          //       final user = UserHive(
          //   data.dbName,
          //   data.userLogin,
          //   data.userName,
          //   password,
          //   null,
          //   null,
          //   null,
          //   4,
          // );
          print("New user document created in 'users' collection");
        } else {
          final user = CloudUser.fromFirestore(userDocSnapshot);
          accessLevel = user.accessLevel.toInt();
          print("Existing user signed in using Google");
        }
        // Sign in with Firebase using the credential (if applicable)
        await FirebaseAuth.instance.signInWithCredential(credential);

        // Access user profile information (name, email, etc.)
        final displayName = googleUser.displayName;
        final email = googleUser.email;
        // ...

        // Handle successful sign-in logic

        final user = UserHive(
          null, //data.dbName,
          null, //data.userLogin,
          null, //data.userName,
          null, //password,
          googleUser.displayName,
          googleUser.email,
          googleUser.photoUrl,
          accessLevel,
          50,
          null,
        );

        final userBox = Hive.box<UserHive>('user');

        await userBox.add(user);

        print(
            "Signed in with Google! Display Name: $displayName, Email: $email");
        emit(const LoginStateSuccess());
      } else {
        print("Sign-in cancelled");
      }
    } catch (error) {
      print("Sign-in error: $error");
      emit(LoginStateError(message: error.toString()));
      // Handle errors appropriately
    }
  }
}
