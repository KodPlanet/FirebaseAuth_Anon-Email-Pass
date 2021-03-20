import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/auth.dart';
import '../widgets/my_raised_button.dart';
import 'package:provider/provider.dart';
import 'email_sign_in.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isLoading = false;

  Future<void> _signInAnonymously() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Auth>(context, listen: false).signInAnonymously();
    } on FirebaseAuthException catch (e) {
      _showErrorDialog(e.code);
    } catch (e) {
      _showErrorDialog(e.toString());
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _signInWithGoogle() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Auth>(context, listen: false).signInWithGoogle();
    } on FirebaseAuthException catch (e) {
      _showErrorDialog(e.code);
    } catch (e) {
      _showErrorDialog(e.toString());
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              Provider.of<Auth>(context, listen: false).signOut();
              print('logout tıklandı');
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sign In Page', style: TextStyle(fontSize: 25)),
            SizedBox(
              height: 30,
            ),
            MyRaisedButton(
              color: Colors.orangeAccent,
              child: Text('Sign In Anonymously'),
              onPressed: _isLoading ? null : _signInAnonymously,
            ),
            SizedBox(
              height: 10,
            ),
            MyRaisedButton(
              color: Colors.yellow,
              child: Text('Sign In Email/PassWord'),
              onPressed: _isLoading
                  ? null
                  : () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmailSignInPage()));
                    },
            ),
            SizedBox(height: 10),
            MyRaisedButton(
              color: Colors.lightBlueAccent,
              child: Text('Google Sign In'),
              onPressed: _isLoading ? null : _signInWithGoogle,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showErrorDialog(String errorText) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('BİR HATA OLUŞTU'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(errorText),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
