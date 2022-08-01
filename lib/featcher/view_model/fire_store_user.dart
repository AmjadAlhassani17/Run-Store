import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:runstore/featcher/model/user_model.dart';

class FireStoreUser {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _userCollection.doc(userModel.userId).set(userModel.toJson() , SetOptions(merge: true));
  }


  Future<void> updateImage({required String imagePath}) async {
    return await _userCollection.doc(FirebaseAuth.instance.currentUser?.uid).set({
      "image" : imagePath
    } , SetOptions(merge: true));
  }

  Future<DocumentSnapshot> getCurrentUser (String uid) async {
    return await _userCollection.doc(uid).get();
  }
}


