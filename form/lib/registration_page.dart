import 'package:flutter/material.dart';
import 'package:form/details_Registration.dart';
import 'global.dart';
import 'shared_preference.dart';
import 'details_Registration.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:volume_controller/volume_controller.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {


  double _brightness = 0.5;
  double _volume = 0.5;

  @override
  void initState(){
    super.initState();
    VolumeController().listener((volume){
      setState(() {
        _volume = volume;
      });
    }
    );
  }
  @override
  void dispose(){
    VolumeController().removeListener();
    super.dispose();
  }

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();

  void registerUser() async{
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    int age = int.tryParse(_ageController.text.trim())??0;

    await saveString('name', name);
    await saveString('email', email);
    await saveInt('age', age);
    await saveBool('isLoggedIn', true);

    currentUser = User(name: name, email: email, age: age,isLoggedIn: true);

    _nameController.clear();
    _ageController.clear();
    _emailController.clear();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>details_Registration()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration Page'),),
      body: Padding(
          padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name'
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email'
              ),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                labelText:'Age',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: registerUser,

                child: Text('Register')),
            Text('Brightness'),
            Slider(value: _brightness,
                onChanged: (value)async{
              setState(()=>_brightness = value);
              await ScreenBrightness().setScreenBrightness(value);
                },),
            Text('Volume'),
            Slider(value: _volume,
                onChanged: (value){
              setState(()=>_volume = value);
              VolumeController().setVolume(value);
                })
          ],
        ),
      ),
    );
  }
}
