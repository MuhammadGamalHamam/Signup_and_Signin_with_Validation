import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  SigninPage({Key key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  // So all this four controller's is for the textfield we're creating
  var _formKey = GlobalKey<ScaffoldState>(); // a scaffold Globalkey
  bool hidePass = true;
  // this is a boolean called hidePass we're going to use it for show and hide password
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
          title: Text('Signin Form'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color(0xffdf8e33)),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  'SOFCO LLC',
                  style: TextStyle(
                    color: Color(0xffdf8e33),
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        icon: Icon(Icons.mail),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _pass,
                      obscureText: hidePass,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        icon: Icon(Icons.security),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            showandhide();
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      height: 45,
                      width: 150,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          formValidate(
                            email: _email.text,
                            pass: _pass.text,
                          );
                        },
                        child: Text(
                          'SIGNIN',
                          style:
                              TextStyle(color: Color(0xffffffff), fontSize: 22),
                        ),
                        color: Color(0xfff7892b),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showandhide() {
    setState(() {
      hidePass = !hidePass;
    });
  }

  void _showInSnackBar({String message}) {
    _formKey.currentState.showSnackBar(
      SnackBar(
        content: GestureDetector(
          onTap: () {},
          child: Text(
            message,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        duration: (Duration(seconds: 4)),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
    );
  }

  formValidate({String email, pass}) {
    if (!email.toString().contains('@') || !email.toString().contains(".")) {
      _showInSnackBar(message: 'The Email Or Password you entered is incorrect');
    } else if (pass.toString().isEmpty ||
        !pass.toString().contains(new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'))) {
      _showInSnackBar(
          message: 'The Email Or Password you entered is incorrect');
    } else {
      openDia(email: email);
    }
  }

  openDia({String email}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Success!'),
            content: Text('Welcome, $email'),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Ok',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          );
        });
  }

  @override
  void initState() {
    _email = TextEditingController();
    _pass = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }
}
