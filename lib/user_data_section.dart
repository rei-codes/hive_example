import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class UserDataSection extends StatelessWidget {
  final userDataBox = Hive.box('userData');

  String get name => userDataBox.get('name', defaultValue: '');
  String? get email => userDataBox.get('email');

  saveUserData() {
    userDataBox.put('name', 'ehe');
    userDataBox.put('email', 'ehe@ehe.com');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('UserData', style: TextStyle(fontSize: 20)),
        Row(children: [Text('name: '), Text(name)]),
        const SizedBox(height: 4),
        Row(children: [Text('email: '), Text('$email')]),
        OutlinedButton(child: Text('Save'), onPressed: saveUserData),
      ],
    );
  }
}
