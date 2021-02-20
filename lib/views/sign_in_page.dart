import 'package:flutter/material.dart';
import 'package:flutter_auth_app/services/auth.dart';
import 'package:flutter_auth_app/widgets/my_raised_button.dart';
import 'package:provider/provider.dart';
import './email_sign_in.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isLoading = false;

  Future<void> _signInAnonymously() async {
    setState(() {
      _isLoading = true;
    });

    final user =
        await Provider.of<Auth>(context, listen: false).signInAnonymously();
    setState(() {
      _isLoading = false;
    });

    print(user.uid);
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
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EmailSignInPage()));
              },
            ),
            SizedBox(height: 10),
            MyRaisedButton(
              color: Colors.lightBlueAccent,
              child: Text('Google Sign In'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
