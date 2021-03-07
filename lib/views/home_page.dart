import 'package:flutter/material.dart';
import 'package:flutter_auth_app/services/auth.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
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
        body: Center(child: Container(child: Text('HOME PAGE'))));
  }
}
