import 'package:flutter/material.dart';
import 'package:kaivigan_2022/models/user_model.dart';
import 'package:kaivigan_2022/ui/dash/dash_layout.dart';

class Wrapper extends StatelessWidget {
  static String routeName = "/wrapper";
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel? _user;
    if (_user == null) return DashLayout();
    return const CircularProgressIndicator();
  }
}
