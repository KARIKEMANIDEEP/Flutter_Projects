import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task1/Details.dart';

List studentData = [];
Map data = {};

class Newscreen extends StatefulWidget {
  const Newscreen({super.key});
  @override
  State<Newscreen> createState() => _NewscreenState();
}
class _NewscreenState extends State<Newscreen> {

  String _Gender = '';

  bool _isLoading = false;

   void studentDataClear(){

    _Title.clear();
    _FirstNameController.clear();
    _LastNameController.clear();
    _HusbandController.clear();
    _NameController.clear();
    _MobileNumberController.clear();
    _AlternativeMobileNumberController.clear();
    _MaritalStatusController.clear();
    _dateController.clear();
    _SelectCityController.clear();
    _AddressController.clear();
    setState(() {
      _dateController;
    });
  }

  TextEditingController _dateController = TextEditingController();
  Future<void> _selectDate() async{
    DateTime?_picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if(_picked != null){
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  TextEditingController _Title = TextEditingController();
  TextEditingController _FirstNameController = TextEditingController();
  TextEditingController _LastNameController = TextEditingController();
  TextEditingController _HusbandController = TextEditingController();
  TextEditingController _NameController = TextEditingController();
  TextEditingController _MobileNumberController = TextEditingController();
  TextEditingController _AlternativeMobileNumberController = TextEditingController();
  TextEditingController _MaritalStatusController = TextEditingController();
  TextEditingController _SelectCityController = TextEditingController();
  TextEditingController _AddressController = TextEditingController();

  showAlertDialog(BuildContext context, String message){
    Widget okButton = TextButton(
        child: Text('OK',
        style: TextStyle(color: Colors.white),
        ),
      onPressed: (){
          Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text('ERROR!!',
      style: TextStyle(color: Colors.white)
      ),
      content: Text(
         message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
      actions: [
        okButton
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context){
          return alert;
        },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "REGISTRATION",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> const details()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: const Text(
                "Details",
              style: TextStyle(
                color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),

        child: ListView(
          children: [
            ///
            Row(
              children: [
                Container(
                  width: 90,
                  child: TextFormField(
                    controller: _Title,
                    decoration:  const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText:"Select title",
                      hintText: "Title"
                    ) ,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 250,
                    child: TextFormField(
                      controller: _FirstNameController,
                      decoration:  const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText:"First Name",
                          hintText: "Enter First Name"
                      ) ,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                            child: TextFormField(
                              controller: _LastNameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'LastName',
                                hintText: 'Enter Last Name'
                              ),
                            ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      width: 90,
                      child: TextFormField(
                        controller: _HusbandController,
                        decoration:  const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText:"Husband/Father",
                            hintText: "Title"
                        ) ,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 238,
                        child: TextFormField(
                          controller: _NameController,
                          decoration:  const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText:"Name",
                              hintText: "Enter Husband/Father Name"
                          ) ,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    child: TextFormField(
                      controller: _MobileNumberController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mobile Number',
                        hintText: '91+'
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    child: TextFormField(
                      controller: _AlternativeMobileNumberController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Alternative Mobile Number',
                        hintText: '+91'
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Gender',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Radio(
                          value: 'MALE',
                          groupValue: _Gender,
                        onChanged: (String? value){
                            setState(() {
                              _Gender = value!;
                            });
                        },
                      ),const Text('MALE'),
                      Radio(
                          value: 'FEMALE',
                          groupValue: _Gender,
                          onChanged: (String? value){
                            setState(() {
                              _Gender = value!;
                            });
                          }),const Text('FEMALE'),
                      Radio(
                          value: 'PREFER NOT TO SAY',
                          groupValue: _Gender,
                          onChanged: (String? value){
                            setState(() {
                              _Gender = value!;
                            });
                          }
                      ),const Text('OTHERS'),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 210,
                        child: TextFormField(
                          controller: _MaritalStatusController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Marital Status',
                            hintText: 'select'
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: const Text(
                              'Registration : ₹0',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    child: TextFormField(
                      controller: _dateController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Date',
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      readOnly: true,
                      onTap: (){
                        _selectDate();
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding:EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _SelectCityController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText:'Select City',
                        hintText: 'HYDERABAD'
                      ),
                    ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    child: TextFormField(
                      controller: _AddressController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Address',
                      ),
                      maxLines: 5,
                    )
                  )
                ],
              ),
            ),


    ElevatedButton(
    onPressed: _isLoading
    ? null
        : () async {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(Duration(seconds: 2));

      if (_Title.text.isEmpty) {
        showAlertDialog(context, "Please fill Title");
      } else if (_FirstNameController.text.isEmpty) {
        showAlertDialog(context, "Please fill First Name");
      } else if (_LastNameController.text.isEmpty) {
        showAlertDialog(context, "Please fill Last Name");
      } else if (_HusbandController.text.isEmpty) {
        showAlertDialog(context, "Please fill Husband/Father");
      } else if (_NameController.text.isEmpty) {
        showAlertDialog(context, "Please fill Name");
      } else if (_MobileNumberController.text.isEmpty) {
        showAlertDialog(context, "Please fill Mobile Number");
      } else if (_AlternativeMobileNumberController.text.isEmpty) {
        showAlertDialog(context, "Please fill Alternative Number");
      } else if (_MaritalStatusController.text.isEmpty) {
        showAlertDialog(context, "Please fill Marital Status");
      } else if (_dateController.text.isEmpty) {
        showAlertDialog(context, "Please fill Date Of Birth");
      } else if (_SelectCityController.text.isEmpty) {
        showAlertDialog(context, "Please fill City");
      } else if (_AddressController.text.isEmpty) {
        showAlertDialog(context, "Please fill Address");
      } else if (_Gender.isEmpty) {
        showAlertDialog(context, "Please fill Gender");
      } else {
        Map<String, dynamic> newData = {
          'title': _Title.text,
          'firstName': _FirstNameController.text,
          'lastName': _LastNameController.text,
          'husband/father': _HusbandController.text,
          'name': _NameController.text,
          'mobileNumber': _MobileNumberController.text,
          'alternativeNumber': _AlternativeMobileNumberController.text,
          'gender': _Gender,
          'maritalStatus': _MaritalStatusController.text,
          'date': _dateController.text,
          'selectCity': _SelectCityController.text,
          'address': _AddressController.text,
        };

        studentData.add(newData);
        studentDataClear();


        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration Successful')),
        );
      }
      setState(() {
        _isLoading = false;
      });
    },
    child: _isLoading
    ? const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(
          color: Colors.blueAccent,
          strokeWidth: 4,
        ),
        SizedBox(width: 10),
        Text("Registering..."),
      ],

    )
        : Text("Register Now"),
    ),
    ],
        ),
      ),
    );
  }
}
