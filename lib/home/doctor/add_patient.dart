import 'package:flutter/material.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({Key? key}) : super(key: key);

  @override
  _AddPatientState createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Add Patient'),),
        body: PatientForm(),
    );
  }
}

Widget PatientForm(){
  final _formKey = GlobalKey<FormState>();
  return Form(
    key: _formKey,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              //icon: const Icon(Icons.person),
              hintText: 'Enter your name',
              labelText: 'Name',
              border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              //icon: const Icon(Icons.phone),
              hintText: 'Enter a phone number',
              labelText: 'Mobile',
              border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              //icon: Icon(Icons.email),
              hintText: 'Email [Optional]',
              labelText: 'Email [Optional]',
                border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              //icon: Icon(Icons.add_location),
              hintText: 'Email [Optional]',
              labelText: 'Email [Optional]',
                border: OutlineInputBorder()
            ),
          ),
          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              child: new RaisedButton(
                child: const Text('Submit'),
                onPressed: null,
              )),
        ],
      ),
    ),
  );

}