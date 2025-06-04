import 'package:flutter/material.dart';
class RegistrationDetails {
  static List<RegistrationDetails> allDetails = [];

  String name;
  String dob;
  String gender;
  String mobile;
  String email;
  String address;
  String department;
  String consultationType;
  String guardianName;
  String guardianContact;

  RegistrationDetails({
    required this.name,
    required this.dob,
    required this.gender,
    required this.mobile,
    required this.email,
    required this.address,
    required this.department,
    required this.consultationType,
    required this.guardianName,
    required this.guardianContact,
  });
}


class registrationForm extends StatefulWidget {
  const registrationForm({super.key});

  @override
  State<registrationForm> createState() => _registrationFormState();
}

class _registrationFormState extends State<registrationForm> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController  = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final  TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController guardianNameController = TextEditingController();
  final TextEditingController guardianContactController = TextEditingController();

  String? gender;
  String? department;
  String? consultationType;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Patient Registration Form'),backgroundColor: Colors.blue,),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [

            //Name

            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Full Name'),
              validator: (value)=> value!.isEmpty? 'Please Enter the name':null,
            ),

            //DOB

            TextFormField(
              controller: dobController,
              decoration: InputDecoration(labelText: 'Date of Birth'),
              validator: (value)=>value!.isEmpty?'Please Enter The Date of Birth':null,
            ),

            //Gender

            DropdownButtonFormField<String>(
              value: gender,
              decoration: InputDecoration(labelText: 'Gender'),
              items: ['Male','Female','other']
              .map((e)=> DropdownMenuItem(value: e,child: Text(e)))
              .toList(),
              onChanged: (val)=>setState(() {
                gender = val;
              }),
              validator: (value)=>value==null?'Select Gender':null,
            ),

            //mobile

            TextFormField(
              controller: mobileController,
              decoration: InputDecoration(labelText: 'MobileNumber'),
              keyboardType: TextInputType.phone,
              validator: (value)=>value!.isEmpty?'Please Enter the number':null,
            ),

            //Email

            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (value)=>value!.isEmpty?'Please Enter the email':null,
            ),

            //address

            TextFormField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
              maxLines: 2,
            ),

            //Department

            DropdownButtonFormField<String>(
              value: department,
              decoration: InputDecoration(labelText: 'Department'),
              items: ['General','Medical','Emergency']
              .map((e)=> DropdownMenuItem(value: e,child:Text(e)))
                  .toList(),
              onChanged: (val)=>setState(() {
                department = val;
              }),
              validator: (value)=> value!.isEmpty?'Please select the department':null,
            ),

            //consultationType

            DropdownButtonFormField(
              value: consultationType,
              decoration: InputDecoration(labelText: 'ConsultationType'),
              items: ['OP','IP','VP']
                .map((e)=> DropdownMenuItem(value: e,child:Text(e)))
                .toList(),
              onChanged: (val)=>setState(() {
                consultationType = val;
              }),
              validator: (value)=> value!.isEmpty?'Please select consulationType':null,
            ),

            //Guardian

            TextFormField(
              controller: guardianNameController,
              decoration: InputDecoration(labelText: 'GuardianName'),
            ),

            //GuardianNumber

            TextFormField(
              controller: guardianContactController,
              decoration: InputDecoration(labelText: 'GuardianNumber'),
              keyboardType: TextInputType.phone,
            ),

            SizedBox(height: 20),

            //submit

            ElevatedButton(
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    RegistrationDetails registrationDetails = RegistrationDetails(
                      name: nameController.text,
                      dob: dobController.text,
                      gender: gender!,
                      mobile: mobileController.text,
                      email: emailController.text,
                      address: addressController.text,
                      department: department!,
                      consultationType: consultationType!,
                      guardianName: guardianNameController.text,
                      guardianContact: guardianContactController.text,
                    );

                    RegistrationDetails.allDetails.add(registrationDetails);

                    nameController.clear();
                    dobController.clear();
                    mobileController.clear();
                    emailController.clear();
                    addressController.clear();
                    guardianNameController.clear();
                    guardianContactController.clear();

                    setState(() {
                      gender = null;
                      department = null;
                      consultationType = null;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Form Submitted')),
                    );
                    Navigator.pop(context);
                  }

                },child: Text('SUBMIT'),
            )
          ],
        ),
      )
      ),
    );
  }
}
