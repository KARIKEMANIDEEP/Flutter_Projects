import 'package:flutter/material.dart';
import 'NewScreen.dart';


import 'login.dart';
import 'CGPA.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg-image.png"),fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0,left: 8,right: 10),
                child: Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// logo
                        SizedBox(
                          width:  MediaQuery.of(context).size.width *0.2,
                          child: Image.asset('assets/images/logo.png'),
                        ),
                        const SizedBox(width: 5,),
                        SizedBox(
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 160,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(15.0)
                                ),
                                child:const Padding(
                                  padding: EdgeInsets.only(left: 5, right: 5,top: 2),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '25-march-2025',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,

                                            ),
                                          ),
                                          Text(
                                            '14:18',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text('Thursday'),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                 width: 160,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white70,
                                          borderRadius: BorderRadius.circular(15.0)
                                      ),child: Text('NS'),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white70,
                                          borderRadius: BorderRadius.circular(15.0)
                                      ),child: Text('WD 10'),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white70,
                                          borderRadius: BorderRadius.circular(15.0)
                                      ),child: Text('BED 40'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 6,),
                        Row(
                          children: [
                            Container(
                              height:100 ,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                            ),
                            const SizedBox(width: 5,),
                            Container(
                              height:100 ,
                              width: 60,
                              //alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              child:  const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Text('A',style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text('అ',style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text('अ',style: TextStyle(fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          width:  MediaQuery.of(context).size.width *0.2,
                          height:  MediaQuery.of(context).size.height *0.4,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/images/profile.jpg'),
                              ),
                              const Text(
                                'K. Pawan Kalyan',
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'M/29 Y',
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5,),
                        SizedBox(
                          width:  160,
                          height:  MediaQuery.of(context).size.height *0.4,
                          child:Column(
                            children: [
                              Container(
                                width:  160,
                                height:  MediaQuery.of(context).size.height *0.18,
                                decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(15.0)
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image.asset('assets/images/emergency.png',
                                        height: 80,
                                        width: 140,
                                      ),
                                    ),
                                    const Text(
                                      'Emergency',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 25),
                              Container(
                                width:  160,
                                height:  MediaQuery.of(context).size.height *0.18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.white70,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Column(
                                    children: [
                                      Image.asset('assets/images/assistances.png',
                                        height: 80,
                                        width: 140,
                                      ),
                                      const Text(
                                        'Assistances',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 6,),
                        SizedBox(
                          width:  125,
                          height:  MediaQuery.of(context).size.height *0.4,
                          child:Column(
                            children: [
                              Container(
                                height:  MediaQuery.of(context).size.height *0.18,
                                decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(15.0)
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image.asset('assets/images/food.png',
                                        height: 80,
                                        width: 140,

                                      ),
                                    ),
                                    const Text(
                                      'Food',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 25),
                              Container(
                                height:  MediaQuery.of(context).size.height *0.18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.white70,

                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Column(
                                    children: [
                                      Image.asset('assets/images/medicine.png',
                                        height: 80,
                                        width: 140,
                                      ),
                                      const Text(
                                        'Medicine',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=> Newscreen()),
                          );
                        },
                        child: Text('Registration')
                    ),

                    ElevatedButton(
                        onPressed: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>login()),
                          );
                    },
                      child: Text('Login'),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>BTechResultApp()),
                        );
                      },
                      child: Text('RESULTS'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>AnimationBasicsPage()),
                        );
                      },
                      child: Text('RESULTS'),
                    ),

                  ],
                ),
              )
          ),
        )
    );
  }
}
