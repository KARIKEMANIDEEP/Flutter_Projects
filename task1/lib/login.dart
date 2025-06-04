import 'package:flutter/material.dart';
import 'welcome.dart';
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
                if(value == null || value.isEmpty){
                      return 'Please Enter the userName';
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
                if(value == null || value.isEmpty){
                  return ' Please Enter the Password';
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> welcome()),
                        );
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill Input')),
                        );
                      }
                    }, child: Text('Submit'),
              ),
            )
            )
          ],
        ),

        ),
      ),
    );
  }
}
