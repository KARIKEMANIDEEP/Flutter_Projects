import 'package:firebase/home.dart';
import 'package:firebase/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            
            Text(
              'Login',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Username or Email',
                      labelText: 'Username or Email',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(height: 30),


                  ElevatedButton(
                    onPressed: () async{
                      try{
                        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim()
                        );
                        _emailController.clear();
                        _passwordController.clear();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context)=>Home())
                        );
                      }
                      on FirebaseAuthException catch(e){
                        String message = '';
                        if(e.code == 'user-not-found'){
                          message ='No user found for the email';
                        }
                        else if(e.code == 'Wrong password provided'){
                          message = 'Wrong password provided';
                        }
                        else {
                          message = 'Something went wrong';
                        }
                        showDialog(
                            context: context,
                            builder: (context)=>AlertDialog(
                              title: Text('Login Failed'),
                              content: Text(message),
                              actions: [
                                TextButton(onPressed: ()=>Navigator.pop(context),
                                    child: Text('Ok')
                                )
                              ],
                            )
                        );
                      }
                    },
                    child: Text('Login'),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('New to Login?',style: TextStyle(color: Colors.blue)),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context)=>Register()),
                          );
                        },
                        child: Text('Register Now !!',style: TextStyle(color: Colors.blue),),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
