import 'package:flutter/material.dart';
import 'Signin.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phn = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _cpass = TextEditingController();
  // So all this four controller's is for the textfield we're creating
  var _formKey = GlobalKey<ScaffoldState>(); // a scaffold Globalkey
  bool hidePass = true;
  // this is a boolean called hidePass we're going to use it for show and hide password
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
          title: Text('Registeration Form'),
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
                    TextFormField(
                      controller: _name,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'Full Name',
                      ),
                    ), // textfield for the name session and so on
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
                      controller: _phn,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        icon: Icon(Icons.call),
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
                    SizedBox(height: 10),
                    TextFormField(
                      obscureText: hidePass,
                      controller: _cpass,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        icon: Icon(Icons.border_color),
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
                      height: 50,
                      width: 190,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          formValidate(
                            name: _name.text,
                            email: _email.text,
                            cpass: _cpass.text,
                            pass: _pass.text,
                            phn: _phn.text,
                          );
                        },
                        child: Text(
                          'Register Now',
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

  formValidate({String name, email, phn, pass, cpass}) {
    if (name.toString().isEmpty) {
      _showInSnackBar(message: 'Full name required');
    } else if (!email.toString().contains('@') ||
        !email.toString().contains(".")) {
      _showInSnackBar(message: 'email must be a valid (email@example.com)');
    } else if (phn.toString().isEmpty ||
        !phn.toString().contains(new RegExp(r'(^(?:[+0]9)?[0-9]{11,12}$)'))) {
      _showInSnackBar(message: 'Invalid, phone number must be 11 number');
    } else if (pass.toString().isEmpty ||
        !pass.toString().contains(new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'))) {
      _showInSnackBar(
          message:
              'Invalid, password must be at least 8 characters including Uppercase Letter, Lowercase Letter, Digits, special character [!@#%&.]');
    } else if (cpass.toString() != pass.toString()) {
      _showInSnackBar(message: 'Password does not match');
    } else {
      openDia(name: name);
    }
  }
  
  Future navigateToSubPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SigninPage()));
  }

  openDia({String name}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Registration Successfully'),
            content: Text('Go to Email to Verify Account'),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  navigateToSubPage(context);
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
    _name = TextEditingController();
    _email = TextEditingController();
    _phn = TextEditingController();
    _pass = TextEditingController();
    _cpass = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phn.dispose();
    _pass.dispose();
    _cpass.dispose();
    super.dispose();
  }
}
