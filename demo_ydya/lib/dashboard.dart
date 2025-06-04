import 'dart:convert';

import 'package:demo_ydya/registraionForm.dart';
import 'package:demo_ydya/registrationDetails.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'dashboard_model.dart';

import 'thirdPage.dart';

import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool _isLoading = true;
  late DashboardModel _modelObj;

  @override
  void initState(){
    super.initState();
    dashbBoardDetails();

  }
  Future<void> _logOut() async{

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const login()),
        (Route<dynamic>route)=>false,
    );
  }

  Future<void> dashbBoardDetails() async{

    try{
      String details = await rootBundle.loadString("assets/map.json");
      final decodeResponse = await jsonDecode(details);
      print("Decoded JSON : $decodeResponse");


      final dashboardModelObj = DashboardModel.fromJson(json: decodeResponse[0]);

      setState(() {
        _modelObj = dashboardModelObj;
        _isLoading = false;
      });

    }
    catch(error){
      print("Error");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content : Text('failed to load data '),

          ),
      );
    }

  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dashboard"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: _logOut,
          icon: Icon(Icons.logout),color: Colors.black,tooltip:'LogOut',)

        ],
      ),
      body:  _isLoading
        ? Center(child: CircularProgressIndicator(),)
          :Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Welcome: Dr. ${_modelObj.doctorName?? 0}',style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                child: ListTile(
                  leading: Icon(Icons.calendar_today),
                  title: Text('${_modelObj.todayApmntMsg??0}',),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Card(
                        child: Container(
                          height: 80,
                          child: ListTile(
                            leading: Text('OP', style: TextStyle(fontSize: 20)),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Column(
                                      children: [
                                        Text('${_modelObj.completedCnt ?? 0}'),
                                        Text('Completed'),
                                      ],
                                    ),
                                    SizedBox(width: 4,),
                                    Container(
                                      height: 20,
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 4,),
                                    Column(
                                      children: [
                                        Text('${(_modelObj.totalApmntCnt ?? 0) - (_modelObj.completedCnt ?? 0)} '),
                                        Text('Waiting')
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                  ),
                  SizedBox(width: 8),
                  Expanded(
                      child: Card(
                        child: Container(
                          height: 80,
                          child: ListTile(
                            leading: Text('IP',style: TextStyle(fontSize: 20),),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Column(
                                      children: [
                                        Text('${_modelObj.todayDschrgCnt??0}'),
                                        Text('Discharged')
                                      ],
                                    ),
                                    SizedBox(width: 4,),
                                    Container(
                                      height: 20,
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 4,),
                                    Column(
                                      children: [
                                        Text('${_modelObj.todayOnBedCnt??0}'),
                                        Text('On The Bed')
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),

                          ),
                        ),
                      ) )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(child:
                Card(
                  child: Container(
                    height: 80,
                    child: ListTile(
                      leading: Text('critical Alerts',style: TextStyle(fontSize: 15),),

                      title: Text('${_modelObj.opCriticalAlert??0} '),

                    ),
                  ),
                )
                ),SizedBox(width: 8,),
                Expanded(
                    child: Card(
                      child: Container(
                        height: 80,
                        child: ListTile(
                          leading: Text('ER patients',style: TextStyle(fontSize: 15),),
                          title: Text('${_modelObj.todayErCnt??0} '),

                        ),
                      ),
                    )
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card(
                    child: Container(
                      height: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cross Consults'),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text('OP',style: TextStyle(fontSize: 20),),
                                  Text('${_modelObj.opReferralCnt?? 0}',style: TextStyle(fontSize: 20),),

                                ],
                              ),

                              SizedBox(width: 20,),
                              Container(
                                height: 40,
                                width: 1,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 20,),
                              Column(
                                children: [
                                  Text('IP',style: TextStyle(fontSize: 20),),
                                  Text('${_modelObj.ipReferralCnt ??0}',style: TextStyle(fontSize: 20),),

                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card(
                    child: Container(
                      height: 80,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Stack(
                        children: [

                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text('Tomorrow', style: TextStyle(fontSize: 12)),
                                    SizedBox(height: 8,),
                                    Text('${_modelObj.nextApmntDt??0}',style: TextStyle(fontSize: 20),),
                                  ],
                                ),

                                Column(
                                  children: [
                                    Text('${_modelObj.nextDayApmntMsg?? "Tomorrow you have 0 appointments"}'),
                                    SizedBox(height: 8,),
                                    Text('${_modelObj.nextDayBookedCnt??0}',style: TextStyle(fontSize: 20),),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          Positioned(
                            bottom: 5,
                            left: 0,
                            child: Text(
                              'Wednesday',
                              style: TextStyle(color: Colors.grey),
                            ),

                          ),
                          Positioned(
                            bottom: 5,
                            right: 70,
                            child: Text('Appointments',style: TextStyle(color: Colors.grey),),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context)=> PatientListScreen()),
                  );
                },child: Text('EMR')
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> DisplayRegistrationDetails()),
                  );
                },child:Icon(Icons.insert_comment)
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> DisplayRegistrationDetails()),
                  );
                },child:Text('To Register')
            ),

          ],
        ),
      ),
    );
  }
}
