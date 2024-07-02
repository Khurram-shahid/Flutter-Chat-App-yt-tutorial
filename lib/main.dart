import 'package:chatapp_yt/pages/homepage.dart';
import 'package:chatapp_yt/pages/userauth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder<bool>(
            future: _checkifLogedIn(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData && snapshot.data == true) {
                return const HomePage();
              } else {
                return const UserAuth();
              }
            }));
  }

  Future<bool> _checkifLogedIn() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool('isLoggedIn') ?? false;
  }
}
