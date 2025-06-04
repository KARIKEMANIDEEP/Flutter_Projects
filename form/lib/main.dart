// import 'package:flutter/material.dart';
// import 'package:form/registration_page.dart';
// import 'list.dart';
// import 'Tab.dart';
//
//
// void main() {
//   runApp(const FormFile());
// }
//
// class FormFile extends StatelessWidget {
//   const FormFile({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Homepage(),
//     );
//   }
// }
//
// class Homepage extends StatefulWidget {
//   const Homepage({super.key});
//
//   @override
//   State<Homepage> createState() => _HomepageState();
// }
//
// class _HomepageState extends State<Homepage> {
//   // String _selectedProfession = '';
//   // Map<String, bool> checkBoxList = {
//   //   "Daytrader": false,
//   //   "Shortterm": false,
//   //   "Longterm": false,
//   // };
//   // String dropdownvalue = 'Coal India';
//   // var items = [
//   //   'Coal India',
//   //   'BEL',
//   //   'GMR',
//   //   'Suzlon',
//   //   'UjjivanBank',
//   // ];
//   // int _counter=0;
//   // void _incrementCounter(){
//   //   setState(() {
//   //     _counter++;
//   //   });
//   // }
//
//   // @override
//   // Widget build(BuildContext context) {
//     // return Scaffold(
//     //   appBar: AppBar(
//     //     title: const Text("Application for Stock Market"),
//     //     backgroundColor: Colors.blue,
//     //   ),
//     //   body: Padding(
//     //     padding: const EdgeInsets.all(16.0),
//     //     child: ListView(
//     //       children: [
//     //         TextFormField(
//     //           decoration: const InputDecoration(
//     //             icon: Icon(Icons.person),
//     //             labelText: "Investor ID",
//     //             hintText: "Username",
//     //           ),
//     //         ),
//     //         const SizedBox(height: 20),
//     //         const Text("Profession: "),
//     //         Row(
//     //           children: [
//     //             Radio(
//     //               value: 'Investor',
//     //               groupValue: _selectedProfession,
//     //               onChanged: (String? value) {
//     //                 setState(() {
//     //                   _selectedProfession = value!;
//     //                 });
//     //               },
//     //             ),
//     //             const Text('Investor'),
//     //             Radio(
//     //               value: 'Trader',
//     //               groupValue: _selectedProfession,
//     //               onChanged: (String? value) {
//     //                 setState(() {
//     //                   _selectedProfession = value!;
//     //                 });
//     //               },
//     //             ),
//     //             const Text('Trader'),
//     //             Radio(
//     //               value: 'Advisor',
//     //               groupValue: _selectedProfession,
//     //               onChanged: (String? value) {
//     //                 setState(() {
//     //                   _selectedProfession = value!;
//     //                 });
//     //               },
//     //             ),
//     //             const Text('Advisor'),
//     //           ],
//     //         ),
//     //         const SizedBox(height: 20),
//     //         const Text("Type of Investing: "),
//     //         Column(
//     //           children: checkBoxList.keys.map((key) {
//     //             return Row(
//     //               children: [
//     //                 Checkbox(
//     //                   value: checkBoxList[key],
//     //                   onChanged: (value) {
//     //                     setState(() {
//     //                       checkBoxList[key] = value!;
//     //                     });
//     //                   },
//     //                 ),
//     //                 Text(key),
//     //               ],
//     //             );
//     //           }).toList(),
//     //         ),
//     //         TextButton(
//     //             style: TextButton.styleFrom(
//     //               foregroundColor: Colors.blue,
//     //               disabledForegroundColor: Colors.red,
//     //             ),
//     //             onPressed: null,
//     //             child: Text('Submit'),),
//     //         ElevatedButton(
//     //           style: TextButton.styleFrom(
//     //             foregroundColor: Colors.green,
//     //             backgroundColor: Colors.blue,
//     //           ),
//     //             onPressed: (){
//     //             setState(() {
//     //
//     //             });
//     //             },
//     //             child: Text('Cancel'),),
//     //
//     //         const SizedBox(height: 20),
//     //         const Text("Stocks"),
//     //         DropdownButton(
//     //           value: dropdownvalue,
//     //           icon: const Icon(Icons.keyboard_arrow_down),
//     //           items: items.map((String items){
//     //             return DropdownMenuItem(
//     //             value:items,
//     //             child:Text(items),
//     //             );
//     //         }).toList(),
//     //           onChanged: (String?  newValue) {
//     //             setState(() {
//     //               dropdownvalue = newValue!;
//     //             });
//     //           },
//     //         ),
//     //         ElevatedButton(
//     //             onPressed: (){
//     //               Navigator.push(
//     //                   context,
//     //                   MaterialPageRoute(builder: (context)=>  MyApp()),
//     //               );
//     //             },
//     //             child: Text("Click me")),
//     //         ElevatedButton(
//     //             onPressed: (){
//     //               Navigator.push(
//     //                 context,
//     //                 MaterialPageRoute(builder: (context)=>  Tab_View()),
//     //               );
//     //             },
//     //             child: Text("TAB me")),
//     //         ElevatedButton(
//     //             onPressed: (){
//     //               Navigator.push(
//     //                 context,
//     //                 MaterialPageRoute(builder: (context)=>  RegistrationPage()),
//     //               );
//     //             },
//     //             child: Text("TAB me"))
//     //       ],
//     //     ),
//     //   ),
//     // );
//   }
// }
// lib/main.dart

import 'package:flutter/material.dart';
import 'registration_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
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
    return MaterialApp(
      title: 'Registration Demo',
      debugShowCheckedModeBanner: false,
      home: RegistrationPage(),
    );
  }
}
