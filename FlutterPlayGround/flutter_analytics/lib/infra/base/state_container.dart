import 'package:flutter/material.dart';

class User {
  String? firstName;
  String? lastName;
  String? email;

  User(this.firstName, this.lastName, this.email);
}

//example https://gist.github.com/ericwindmill/f790bd2456e6489b1ab97eba246fd4c6
class StateContainer extends StatefulWidget {
  final Widget child;
  final User? user;

  const StateContainer({
    required this.child,
    this.user,
  });

  static StateContainerState of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<_InheritedStateContainer>()!
      .data;

  @override
  State<StateContainer> createState() => StateContainerState();
}

class StateContainerState extends State<StateContainer> {
  User? user;

  @override
  Widget build(BuildContext context) =>
      _InheritedStateContainer(child: widget.child, data: this);

  void updateUserInfo({firstName, lastName, email}) {
    if (user == null) {
      user = User(firstName, lastName, email);
      setState(() {
        user = user;
      });
    } else {
      setState(() {
        user!.firstName = firstName;
        user!.lastName = lastName;
        user!.email = email;
      });
    }
  }

  void dispose() {
    super.dispose();
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final StateContainerState data;

  _InheritedStateContainer(
      {Key? key, required Widget child, required this.data})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
