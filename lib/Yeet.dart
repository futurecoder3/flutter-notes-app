import 'package:flutter/material.dart';
import 'package:notes_app/addnotes.dart';

class Auth extends StatefulWidget {
  static String id = "auth";
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final GlobalKey <FormState> formKey = GlobalKey<FormState>()
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: Text('Auth'),
      backgroundColor: Colors.amber,
      centerTitle: true,
    ),
    backgroundColor: Colors.red,
    body: Container(
      padding: EdgeInsets.all(30.0),
      child: Form(
        key: formKey,
        child: Column(
         children: <Widget>[
           Text(
             'Authentication',
             style: TextStyle(
               fontSize: 36.0,
               fontWeight: FontWeight.bold
             ),
           ),
           SizedBox(height: 20.0),
           TextFormField(
             decoration: InputDecoration(
               hintText: 'Email'
             ),
             keyboardType: TextInputType.emailAddress,
             validator: (String email) {
               if (email == null || email.isEmpty)
                 return "Please Enter Your Email";
               else {
                 return null;
               }
             }

           ),
           TextFormField(
             decoration: InputDecoration(
               hintText: 'Password'
             ),
              keyboardType: TextInputType.visiblePassword,
             obscureText: true,
             validator: (String password) {
               if (password == null || password.isEmpty)
                 return "Please enter your password";
               else {
                 return null
               }
             },
           ),
           Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
              ElevatedButton(
                child: Text('Login'),
                onPressed: () {
               if (formKey.currentState.validate() == true) {
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logging in user')));
               }
               else {
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error logging in user')));
               }

                },
              ),
              SizedBox(width: 16.0),
               ElevatedButton(onPressed: () {}, child: Text('Register')),
               SizedBox(width: 16.0),
               ElevatedButton(
                child: Text('Add Note'),
                 onPressed: () {
                  Navigator.pushNamed(context, AddNote.id)
                 },
             ],
           ),
           )
         ],
        ),
      ),
     ),
    );
  }
}
