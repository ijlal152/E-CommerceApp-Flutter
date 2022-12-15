import 'package:ecommerceappbloc/NewCode/Models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> signUp({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDataToFirestore(email, password)});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // post data to firestore
  postDataToFirestore(String email, String password) async{
    User? user = _firebaseAuth.currentUser;

    UserModel userModel = UserModel();
    userModel.user_id = user!.uid;
    userModel.user_email = email.toString();
    userModel.user_password = password.toString();

    await firebaseFirestore.collection("UserTable")
        .doc(user.uid)
        .set(userModel.toMap()
    );

    Fluttertoast.showToast(msg: "Account created successfully");
  }

  Future<void> signIn({required String email, required String password,}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }

}

