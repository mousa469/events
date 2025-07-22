import 'dart:developer';

import 'package:events/core/errors/firebase%20auth%20errors/firebase_auth_exception_handler.dart';
import 'package:events/core/errors/un_expected_exception.dart';
import 'package:events/core/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:events/features/authentication/data/models/user.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices extends AuthServices {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserModel> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      userCredential.user!.updateDisplayName(name);

      UserModel user = UserModel(
        userID: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: name,
      );

      return user;
    } on FirebaseAuthException catch (authException) {
      log(
        "firebase auth exception come from FirebaseAuthServices.createUserWithEmailAndPassword and message is : ${authException.message}  ",
      );

      CustomFirebaseAuthException.handle(authException: authException);
      rethrow;
    } catch (e) {
      log(
        "general exception come from FirebaseAuthServices.createUserWithEmailAndPassword and message is : ${e.toString()}  ",
      );

      throw UnExpectedException();
    }
  }

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      UserModel user = UserModel(
        userID: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: userCredential.user!.displayName!,
      );

      return user;
    } on FirebaseAuthException catch (authException) {
      log(
        "firebase auth exception come from FirebaseAuthServices.createUserWithEmailAndPassword and message is : ${authException.message}  ",
      );

      CustomFirebaseAuthException.handle(authException: authException);
      rethrow;
    } catch (e) {
      log(
        "general exception come from FirebaseAuthServices.createUserWithEmailAndPassword and message is : ${e.toString()}  ",
      );

      throw UnExpectedException();
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      await GoogleSignIn().signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);

      UserModel userModel = UserModel(
        userID: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: userCredential.user!.displayName!,
      );

      // Once signed in, return the UserCredential
      return userModel;
    } on FirebaseAuthException catch (authException) {
      log(
        "firebase auth exception come from signInWithGoogle.createUserWithEmailAndPassword and message is : ${authException.message}  ",
      );

      CustomFirebaseAuthException.handle(authException: authException);
      rethrow;
    } catch (e) {
      log(
        "general exception come from signInWithGoogle.createUserWithEmailAndPassword and message is : ${e.toString()}  ",
      );

      throw UnExpectedException();
    }
  }

  @override
  Future<UserModel> signInWithFacbook() async {
    // Trigger the sign-in flow
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      var userCrediential = await FirebaseAuth.instance.signInWithCredential(
        facebookAuthCredential,
      );

      UserModel userModel = UserModel(
        userID: userCrediential.user!.uid,
        email: userCrediential.user!.email!,
        name: userCrediential.user!.displayName!,
      );

      // Once signed in, return the UserCredential
      return userModel;
    } on FirebaseAuthException catch (authException) {
      log(
        "firebase auth exception come from signInWithFacbook.createUserWithEmailAndPassword and message is : ${authException.message}  ",
      );

      CustomFirebaseAuthException.handle(authException: authException);
      rethrow;
    } catch (e) {
      log(
        "general exception come from signInWithFacbook.createUserWithEmailAndPassword and message is : ${e.toString()}  ",
      );

      throw UnExpectedException();
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (authException) {
      log(
        "firebase auth exception come from FirebaseAuthServices.createUserWithEmailAndPassword and message is : ${authException.message}  ",
      );

      CustomFirebaseAuthException.handle(authException: authException);
      rethrow;
    } catch (e) {
      log(
        "general exception come from FirebaseAuthServices.createUserWithEmailAndPassword and message is : ${e.toString()}  ",
      );

      throw UnExpectedException();
    }
  }
}
