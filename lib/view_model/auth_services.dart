import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:fuseapp/view_model/user_vm.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _userfirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email);
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userfirebase);
  }

  Future<User?> signInWithEmaliandpassward(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    return _userfirebase(credential.user);
  }

  Future<User?> createuserWithEmaliandpassward(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    return _userfirebase(credential.user);
  }

  Future<void> singout() async {
    return await _firebaseAuth.signOut();
  }
}
