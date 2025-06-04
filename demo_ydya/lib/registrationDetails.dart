import 'package:demo_ydya/registraionForm.dart';
import 'package:flutter/material.dart';

class DisplayRegistrationDetails extends StatefulWidget {
  const DisplayRegistrationDetails({super.key});

  @override
  State<DisplayRegistrationDetails> createState() => _DisplayRegistrationDetailsState();
}

class _DisplayRegistrationDetailsState extends State<DisplayRegistrationDetails> {


  @override
  void initState(){
    super.initState();
  }

  void refreshPage(){
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Details'),backgroundColor: Colors.blue,),
      body: RegistrationDetails.allDetails.isEmpty
      ?Center(child: Text('No Details yet!!'))
      :ListView.builder(
          itemCount: RegistrationDetails.allDetails.length,
          itemBuilder: (context, index){
            final details = RegistrationDetails.allDetails[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.all(12),
              child: Padding(padding: EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.blue,
                        child: Text(
                          details.name[0].toUpperCase(),
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(width: 20,),
                      Expanded(child: Text(
                        details.name,
                        style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),
                      ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16,),
                  Divider(),
                  buildKeyValueRow('DOB:', details.dob),
                  buildKeyValueRow('Gender:', details.gender),
                  buildKeyValueRow('Mobile:', details.mobile),
                  buildKeyValueRow('Email:', details.email),
                  buildKeyValueRow('Address:', details.address),
                  buildKeyValueRow('Department:', details.department),
                  buildKeyValueRow('Consultation Type:', details.consultationType),
                  buildKeyValueRow('Guardian Name:', details.guardianName),
                  buildKeyValueRow('Guardian Contact:', details.guardianContact),
                ],
              ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed:() async {
            await Navigator.push(context,
                MaterialPageRoute(builder: (context)=>registrationForm()),
            );
            refreshPage();
          },child: Icon(Icons.app_registration_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
  Widget  buildKeyValueRow(String key, String value){
    return Padding(padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 180,
          child: Text(
            key,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
          ),
        ),
        Expanded(child: Text(
          value,
          style: TextStyle(fontSize: 16),
        ))
      ],
    ),
    );
  }
}
