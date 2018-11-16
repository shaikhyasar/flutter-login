import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Login Demo"),
        elevation: 0.0,
        backgroundColor: Colors.redAccent,
      ),
      body: new Container(
        child: new Form(
          key: formKey,
            child: new Column(
              children: <Widget>[
                emailAddress(),
                password(),
                Container(margin: new EdgeInsets.only(bottom:25.0),),
                submitButton(),
              ],
            )),
      ),
    );
  }


  Widget emailAddress() {
    return  TextFormField(
      decoration: InputDecoration(
        labelText: "Email Address",
        hintText: "you@example.com"
      ),
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      onSaved: (String value) {
        print(value);
      },
      validator: (String value){
        if(!value.contains('@')) {
          return "Please enter a valid email";
        }
      },
    );
  }

  Widget password() {
    return new TextFormField(
      decoration: new InputDecoration(
        labelText: "Password",
      ),
      obscureText: true,
      onSaved: (String value){
        print(value);
      },
      validator: (String value) {
        if(value.length < 6){
          return "Please enter password must have atleast 6 characters";
        }
      },
    );
  }

  Widget submitButton() {
  return   new RaisedButton(
    color: Colors.redAccent,
    elevation: 2.0,
    onPressed: () {
     if(formKey.currentState.validate()) {
      formKey.currentState.save();
//        formKey.currentState.reset();
     }


    },
    child: new Text(
      "Submit",
      style: new TextStyle(color: Colors.white),
    ),
  );
  }
}


