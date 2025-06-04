import 'package:flutter/material.dart';
import 'package:task1/NewScreen.dart';


class details extends StatefulWidget {
  const details({super.key});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  Widget _getDetails(String label, String value){
    return Column(

      children: [
        Text(label,style: TextStyle(fontWeight: FontWeight.bold),),
        Text(value)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        backgroundColor: Colors.blueAccent,
      ),

      body: ListView.builder(
        shrinkWrap: true,
        itemCount: studentData.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _getDetails("Title : ", studentData[index]['title']),
                        _getDetails("FirstName : ", studentData[index]['firstName']),
                      ],
                    ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          _getDetails("lastName : ", studentData[index]['lastName']),
                            _getDetails("Husband/Father : ", studentData[index]['husband/father'])
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _getDetails("Name : ", studentData[index]['name']),
                            _getDetails("Number : ", studentData[index]['mobileNumber'])
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _getDetails("Alternative : ", studentData[index]['alternativeNumber']),
                            _getDetails("Gender : ", studentData[index]['gender'])
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _getDetails("MartialStatus : ", studentData[index]['maritalStatus']),
                            _getDetails("Date : ", studentData[index]['date'])
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _getDetails("SelectCity : ", studentData[index]['selectCity']),
                            _getDetails("Address : ", studentData[index]['address'])
                          ],
                        ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
