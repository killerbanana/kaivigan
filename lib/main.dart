import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kaivigan_2022/models/user_model.dart';
import 'package:kaivigan_2022/services/auth_service.dart';
import 'package:kaivigan_2022/services/routes.dart';
import 'package:kaivigan_2022/services/wrapper.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<UserModel?>.value(
          initialData: null,
          value: AuthService().user,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Wrapper.routeName,
        routes: routes,
      ),
    );
  }
}