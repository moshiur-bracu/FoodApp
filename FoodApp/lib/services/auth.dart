import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:FoodApp/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /*Future getDatabaseInstance(String code) async {
    try {
      final value =
          await Firestore.instance.collection('Products').document(code).get();
      //print(value.data);
      return value.data;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }*/

  // create user obj based on firebase user
  User _donorUserFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_donorUserFromFirebaseUser);
  }

  /*List<Products> _productListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Products(
          imgSrc: doc.data['imgSrc'] ?? '',
          name: doc.data['name'] ?? '',
          price: doc.data['price'] ?? '',
          numOfReviews: doc.data['numOfReviews'] ?? '',
          rating: doc.data['rating'] ?? '',
          textDetails: doc.data['textDetails'] ?? '');
    }).toList();
  }

  Stream<List<Products>> get products {
    return Firestore.instance
        .collection('Products')
        .snapshots()
        .map(_productListFromSnapshot);
  }*/

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      return _donorUserFromFirebaseUser(user);
    } catch (error) {
      Fluttertoast.showToast(msg: 'Account already exists');
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
