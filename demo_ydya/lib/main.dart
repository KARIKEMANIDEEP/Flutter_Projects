import 'package:demo_ydya/dashboard.dart';
import 'package:demo_ydya/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard_model.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> checkLoginStatus() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn')?? false;
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future:checkLoginStatus(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          else if(snapshot.hasData && snapshot.data ==true){
            return login();
          }else{
            return login();
          }
        }
      ),
    );
  }
}
