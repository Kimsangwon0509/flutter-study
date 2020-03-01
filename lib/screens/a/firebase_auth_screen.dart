import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthScreen extends StatefulWidget {
  @override
  _FirebaseAuthScreenState createState() => _FirebaseAuthScreenState();
}

class _FirebaseAuthScreenState extends State<FirebaseAuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool supportsAppleSignIn = false;
  String _userID;
  String _userEmail;
  bool _success;

  Future<bool> isAvailableAppleSignIn() async {
    bool supportsAppleSignIn = await AppleSignIn.isAvailable();
    return supportsAppleSignIn;
  }

  @override
  void initState() {
    super.initState();
    isAvailableAppleSignIn().then((value) {
      setState(() {
        supportsAppleSignIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Auth'),
        leading: CloseButton(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('UserId : $_userID'),
            Text('UserEmail : $_userEmail'),
            Text('Login Success : $_success'),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 300,
              child: RaisedButton(
                onPressed: () {
                  _signInWithGoogle();
                },
                child: Text('Google Login'),
              ),
            ),
            if (supportsAppleSignIn)
              SizedBox(
                width: 300,
                child: RaisedButton(
                  onPressed: () {
                    _signInWithApple();
                  },
                  child: Text('Apple Login'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _signInWithGoogle() async {
    print('_signInWithGoogle');
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;

    final FirebaseUser currentUser = await _auth.currentUser();
    setState(() {
      if (user != null) {
        _success = true;
        _userID = user.uid;
        _userEmail = user.email;
      } else {
        _success = false;
      }
    });
  }

  void _signInWithApple() async {
    print('_signInWithApple');
    AuthorizationRequest authorizationRequest =
        AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName]);
    AuthorizationResult authorizationResult =
        await AppleSignIn.performRequests([authorizationRequest]);
    print(authorizationResult.status);
    AppleIdCredential appleCredential = authorizationResult.credential;
    OAuthProvider provider = new OAuthProvider(providerId: "apple.com");
    AuthCredential credential = provider.getCredential(
      idToken: String.fromCharCodes(appleCredential.identityToken),
      accessToken: String.fromCharCodes(appleCredential.authorizationCode),
    );
    FirebaseAuth auth = FirebaseAuth.instance;
    AuthResult authResult =
        await auth.signInWithCredential(credential); // 인증에 성공한 유저 정보
    FirebaseUser user = authResult.user;

    final FirebaseUser currentUser = await _auth.currentUser();
    setState(() {
      if (user != null) {
        _success = true;
        _userID = user.uid;
      } else {
        _success = false;
      }
    });
  }
}
