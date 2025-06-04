import 'package:flutter/material.dart';
import 'global.dart';
import 'shared_preference.dart';

class details_Registration extends StatefulWidget {
  const details_Registration({super.key});

  @override
  State<details_Registration> createState() => _details_RegistrationState();
}

class _details_RegistrationState extends State<details_Registration> {
  @override
  void initState(){
    super.initState();

  }
  void loadUser() async{
    String name = await getString('name')??"";
    String email = await getString('email')??"";
    int age = await getInt('age')?? 0;
    bool isLoggedIn = await getBool('isLoggedIn')?? false;

    setState(() {
      currentUser = User(name: name, email: email, age: age, isLoggedIn: isLoggedIn);
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details'),),
      body: currentUser==null
      ?Center(child: CircularProgressIndicator())
          : Padding(
          padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Name : ${currentUser?.name??""}'),
            Text('Email ; ${currentUser?.email??""}'),
            Text('Age :  ${currentUser?.age??0}'),
            Text('Logged In : ${currentUser?.isLoggedIn}')

          ],
        ),
      )

    );
  }
}
