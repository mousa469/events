import 'package:events/features/authentication/data/models/user.dart';

abstract class AuthServices {
  Future<UserModel> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel> signInWithGoogle();
  Future<UserModel> signInWithFacbook();
}
