import 'dart:convert';
import 'package:demo_ydya/patients_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PatientListScreen extends StatefulWidget {
  const PatientListScreen({super.key});

  @override
  State<PatientListScreen> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> with TickerProviderStateMixin{
  late TabController _tabController;
  List<Patients> _patientsList = [];



  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    patientsDetails();
  }


  Future<void> patientsDetails() async {
    try {
      String details = await rootBundle.loadString('assets/patients.json');
      final List<dynamic> decodeResponse = jsonDecode(details);

      final patientsList = decodeResponse.map((e) => Patients.fromJson(e)).toList();
      setState(() {
        _patientsList = patientsList;
      });
    } catch (error) {
      print("Error: $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Column(
          children: [
            Text('EMR AMEERPET',style: TextStyle(fontSize: 14),),
            Text('IP',style: TextStyle(fontSize: 12),)
          ],
        ),
        actions: [
          Icon(Icons.search),
          SizedBox(width: 20,),
          Icon(Icons.qr_code_scanner),
          SizedBox(width: 20,),
          Icon(Icons.more_vert)
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,

            ),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,


                tabs: [
                  Tab(text: "P(0)"),
                  Tab(text: "Unit"),
                  Tab(text: "IP(161)"),
                  Tab(text: "ER(2)"),
                ],
              ),
            ),
          ),
        ),





      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(
              hintText: 'Search Patient',
              prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.mic),
                  SizedBox(width: 12,),
                  Icon(Icons.calendar_today),
                  SizedBox(width: 12,),
                  Column(
                    children: [
                      Icon(Icons.filter_list_alt),
                      Text('filter',style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),SizedBox(width: 12,)
                ],
              ),
            ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _patientsList.length,
                itemBuilder: (context, index) {
                  final p = _patientsList[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${p.name},${p.age} Yrs,${p.gender}', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(p.status),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${p.doctor}, ${p.time}/ LOS:${p.los}'),
                              Text('General'),
                            ],
                          ),
                          Text(p.time),
                          Text(p.clinic),
                          Text(p.doctor),
                          Row(
                            children: [
                              ElevatedButton(onPressed: () {}, child: Text("PACS")),
                              SizedBox(width: 10),
                              OutlinedButton(onPressed: () {}, child: Text("EHR")),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),

    );
  }
}
