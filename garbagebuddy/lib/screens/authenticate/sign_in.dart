import 'package:garbagebuddy/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:garbagebuddy/services/auth.dart';
import 'package:garbagebuddy/shared/decoration.dart';

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

final _formKey = GlobalKey<FormState>();

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  bool loading = false;

  //text field state
  String email = '';
  String error = '';
  String password = 'gbuddy';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.green[850],
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        elevation: 0.0,
        title: Text('Garbage Buddy'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[900],
                backgroundImage: AssetImage('assets/gb.png'),
                radius: 85.0,
              ),
              SizedBox(height: 40.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Can number'),
                validator: (val) => val.isEmpty ? 'Enter can no + @gb.com' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 30.0,),
              RaisedButton(
                color: Colors.green[600],
                child: Text(
                  'Go!',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _auth.signInEmailPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Could not sign-in';
                        loading =  false;
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 12.0,),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
