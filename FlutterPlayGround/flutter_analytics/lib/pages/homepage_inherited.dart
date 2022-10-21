import 'package:flutter/material.dart';
import 'package:flutter_analytics/pages/update_user_page_inherited.dart';
import '../infra/base/state_container.dart';

class HomePageInherited extends StatefulWidget {
  const HomePageInherited({super.key});

  @override
  State<HomePageInherited> createState() => _HomePageInheritedState();
}

class _HomePageInheritedState extends State<HomePageInherited> {
  User? _user;

  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);
    _user = container.user;
    var body = _user != null ? _userInfo : _loginPrompt;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page Inherited'),
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _updateUser(context),
        child: Icon(Icons.edit),
      ),
    );
  }

  Widget get _userInfo {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "${_user!.firstName} ${_user!.lastName}",
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "${_user!.email}",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget get _loginPrompt {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Please add user information'),
        ],
      ),
    );
  }

  void _updateUser(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => UpdateUserPageInherited(
          user: _user,
        ),
      ),
    );
  }
}
