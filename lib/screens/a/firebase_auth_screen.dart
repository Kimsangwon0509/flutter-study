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
  bool _success = false;

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
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('UserId : $_userID'),
              Text('UserEmail : $_userEmail'),
              Text('Login Success : $_success'),
              SizedBox(
                height: 50,
              ),
              if (!_success) // 로그아웃 상태일 때
                SizedBox(
                  width: 300,
                  child: RaisedButton(
                    onPressed: () {
                      _signInWithGoogle();
                    },
                    child: Text('Google Login'),
                  ),
                ),
              if (_success) // 로그인 상태일 때
                SizedBox(
                  width: 300,
                  child: RaisedButton(
                    onPressed: () {
                      _signOutWithGoogle();
                    },
                    child: Text('Google Logout'),
                  ),
                ),
              if (supportsAppleSignIn) // 애플 로그인이 지원될 때
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
    await _auth.signInWithCredential(credential);

    final FirebaseUser currentUser = await _auth.currentUser();
    setState(() {
      if (currentUser != null) {
        _success = true;
        _userID = currentUser.uid;
        _userEmail = currentUser.email;
      } else {
        _success = false;
        _userID = null;
        _userEmail = null;
      }
    });
  }

  void _signOutWithGoogle() async {
    print('_signOutWithGoogle');
    _auth.signOut();
    final FirebaseUser currentUser = await _auth.currentUser();
    setState(() {
      if (currentUser != null) {
        _success = true;
        _userID = currentUser.uid;
        _userEmail = currentUser.email;
      } else {
        _success = false;
        _userID = null;
        _userEmail = null;
      }
    });
  }

  void _signInWithApple() async {
    print('_signInWithApple');
    // 1. perform sign-in request
    AuthorizationResult result = await AppleSignIn.performRequests([
      AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);
    // 2. check the result
    switch (result.status) {
      case AuthorizationStatus.authorized:
        AppleIdCredential appleIdCredential = result.credential;
        OAuthProvider oAuthProvider =
            new OAuthProvider(providerId: "apple.com");
        AuthCredential credential = oAuthProvider.getCredential(
          idToken: String.fromCharCodes(appleIdCredential.identityToken),
          accessToken:
              String.fromCharCodes(appleIdCredential.authorizationCode),
        );
        AuthResult authResult =
            await _auth.signInWithCredential(credential); // 인증에 성공한 유저 정보
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
        break;
      case AuthorizationStatus.error:
        print(result.error.toString());
        break;
      case AuthorizationStatus.cancelled:
        print(result.error.toString());
        break;
    }
  }
}
