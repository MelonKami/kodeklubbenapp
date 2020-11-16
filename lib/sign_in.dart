import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<User> signInWithGoogle() async {
  //await Firebase.initializeApp();

  // try {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult = await auth.signInWithCredential(credential);
  final User user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final User _currentUser = auth.currentUser;
  assert(user.uid == _currentUser.uid);

  print('signInWithGoogle succeeded: ${user.uid}');
  return user;
  // } catch (e) {
  //   print('sing in error: $e');
  //   // print('sign in error');
  //   return null;
  // }
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}
