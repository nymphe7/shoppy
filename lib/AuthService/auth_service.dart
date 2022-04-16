import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  CollectionReference collection =
      FirebaseFirestore.instance.collection('flutfire');

  // CollectionReference shopCollection =
  //     FirebaseFirestore.instance.collection('shoppy');

  register(String name, String password, String mobile, String email) async {
    await collection.add(
        {name: 'Name', password: 'Password', mobile: 'Mobile', email: 'Email'});
  }

  createUser(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  signIn(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  // addToShoppy() async {
  //   await shopCollection.add({

  //   });
  // }
}
