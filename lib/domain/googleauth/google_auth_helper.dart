import 'dart:async';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'package:google_sign_in/google_sign_in.dart';

import '../../data/repository/repository.dart';
import '../../presentation/login_screen/models/login_model.dart';

class GoogleAuthHelper {
  /// Handle Google Signin to authenticate user
  Future<GoogleSignInAccount?> googleSignInProcess() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {

      return googleUser;
    }
    return null;
  }

  /// To Check if the user is already signedin through google
  alreadySignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    bool alreadySignIn = await googleSignIn.isSignedIn();
    return alreadySignIn;
  }

  /// To signout from the application if the user is signed in through google
  Future<GoogleSignInAccount?> googleSignOutProcess() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = await googleSignIn.signOut();

    return googleUser;
  }
}


class AppleAuthHelper {
  /// Handle Apple Signin to authenticate user
  Future<AuthorizationCredentialAppleID?> appleSignInProcess() async {
    try {
      final AuthorizationCredentialAppleID appleCredential =
      await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      return appleCredential;
    } catch (error) {
      print('Error signing in with Apple: $error');
      return null;
    }
  }

  /// To Check if the user is already signed in through Apple
  Future<bool> alreadySignInWithApple() async {
    try {
      return await SignInWithApple.isAvailable();
    } catch (error) {
      print('Error checking if signed in with Apple: $error');
      return false;
    }
  }

  /// To sign out from the application if the user is signed in through Apple
  Future<void> appleSignOutProcess() async {
    // As of now, there's no explicit sign-out method for Apple Sign In.
    // Users can be signed out from the app's settings.
    // However, you might need to manage your app's session manually.
    // This function might be just a placeholder if you need some additional logic.
  }
}

