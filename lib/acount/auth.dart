// import 'package:firebase_auth/firebase_auth.dart';

// class Authentication{
//   static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   static User? currentUser;
//    static Future<dynamic> signUp(
//       {required String email, required String pass}) async {
//     try {
//       UserCredential newAccount = await _firebaseAuth
//           .createUserWithEmailAndPassword(email: email, password: pass);
//       print(' 登録完了です ');
//       return newAccount;
//     } on FirebaseAuthException catch (e) {
//       print('$e');
//       return false;
//     }
//   }
//     static Future<dynamic> logIn(
//       {required String email, required String pass}) async {
//     try {
//       final UserCredential results = await _firebaseAuth
//           .signInWithEmailAndPassword(email: email, password: pass);
//       currentUser = results.user;
//       print('ログインできました');
//       return results;
//     } on FirebaseAuthException catch (e) {
//       print('auth lost,$e');
//       return false;
//     }
//   }
// }