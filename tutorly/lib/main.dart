import 'package:flutter/material.dart';
import 'package:tutorly/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:tutorly/services/auth.dart';
import 'package:tutorly/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
