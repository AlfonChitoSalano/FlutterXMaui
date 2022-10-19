import 'package:flutter/material.dart';
import '../infra/custom_widgets/state_container.dart';

class UpdateUserPageInherited extends StatelessWidget {
  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static final GlobalKey<FormFieldState<String>> _firstNameKey =
      new GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> _lastNameKey =
      new GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> _emailKey =
      new GlobalKey<FormFieldState<String>>();

  final User? user;

  const UpdateUserPageInherited({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User Info'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextFormField(
                context,
                key: _firstNameKey,
                hintText: 'First Name',
                initialValue: user?.firstName,
              ),
              _buildTextFormField(
                context,
                key: _lastNameKey,
                hintText: 'Last Name',
                initialValue: user?.lastName,
              ),
              _buildTextFormField(
                context,
                key: _emailKey,
                hintText: 'Email Address',
                initialValue: user?.email,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final form = _formKey.currentState;

          if (form!.validate()) {
            var firstName = _firstNameKey.currentState!.value;
            var lastName = _lastNameKey.currentState!.value;
            var email = _emailKey.currentState!.value;

            if (firstName == '') {
              firstName = null;
            }

            if (lastName == '') {
              lastName = null;
            }

            if (email == '') {
              email = null;
            }

            container.updateUserInfo(
              firstName: firstName,
              lastName: lastName,
              email: email,
            );

            Navigator.pop(context);
          }
        },
      ),
    );
  }

  Widget _buildTextFormField(
    BuildContext context, {
    required Key? key,
    required String? hintText,
    required String? initialValue,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14),
      child: TextFormField(
        initialValue: initialValue,
        key: key,
        style: Theme.of(context).textTheme.bodyText2,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}
