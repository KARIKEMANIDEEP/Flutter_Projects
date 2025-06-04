import 'package:demo_ydya/registraionForm.dart';
import 'package:demo_ydya/registrationDetails.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  final _formKey  = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController =  TextEditingController();

  @override
  void initState(){
    super.initState();
    _loadSavedCredentials();
  }
  Future<void> _loadSavedCredentials() async{
    final prefs = await SharedPreferences.getInstance();
    userNameController.text= prefs.getString('username') ??'';
    passwordController.text = prefs.getString('password') ??'';
  }
  Future<void> _saveCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', userNameController.text);
    await prefs.setString('password', passwordController.text);
    await prefs.setBool('isLoggedIn',true);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: TextFormField(

                  controller: userNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.person),
                      labelText: 'userName'
                  ),
                  validator : (value){
                    if(value == null || value.trim().isEmpty){
                      return 'Please Enter the userName';
                    }
                    if(value.length<4){
                      return 'Username must be atleast 4 characters';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.enhanced_encryption),
                      labelText: 'Password'
                  ),
                  validator: (value){
                    if(value == null || value.trim().isEmpty){
                      return ' Please Enter the Password';
                    }
                    if(value.length<6){
                      return 'password must be atleast 6 characters';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: (){
                        if (_formKey.currentState!.validate()){
                          _saveCredentials();
                          userNameController.clear();
                          passwordController.clear();
                          Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context)=>  DisplayRegistrationDetails()),


                          );
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please fill Input')),
                          );
                        }

                      }, child: Text('Submit'),
                    ),
                  )
              ),

            ],
          ),

        ),
      ),
    );
  }
}
