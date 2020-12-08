import 'package:flutter/material.dart';
import 'package:time_tracker/services/auth.dart';

class HomePage extends StatelessWidget {
  final AuthBase auth;
  final Function(User) onSignOut;

  const HomePage({Key key, @required this.auth, @required this.onSignOut})
      : super(key: key);

  Future<void> _signOut() async {
    try {
      await auth.signOut();
      onSignOut(null);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          FlatButton(
            onPressed: _signOut,
            child: Text(
              'Logout',
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
