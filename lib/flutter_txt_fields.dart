
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_11/home.dart';
import 'package:flutter_app_11/strings.dart';

class TextFields extends StatefulWidget {
  @override
  _TextFieldsState createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields>
{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController;
  TextEditingController passwordController ;
  TextEditingController addressController ;
  TextEditingController mobilenoController;

  String _emailErrorMsg;
  String _passwordErrorMsg;



  @override
  void initState() {

    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    addressController = TextEditingController();
    mobilenoController = TextEditingController();

  }


  void dispose()
  {
    super.dispose();
    emailController.clear();
    passwordController.clear();
    emailController.dispose();
    passwordController.dispose();
    addressController.dispose();
    mobilenoController.dispose();


  }

  Widget build(BuildContext context) {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Form Fields"),
          centerTitle: true,
        ),


        body:Padding(
            padding: EdgeInsets.all(15),
            child:
            SingleChildScrollView(

              child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(


                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: ' Email',
                          hintText: 'Enter Your Email',
                          errorText: _emailErrorMsg

                        ),

                        onChanged: (text) {
                          if( emailController.text.isNotEmpty ){
                  setState(() {
                        _emailErrorMsg = null;
                            });
              }
                             else if(emailController.text.isEmpty){



                          setState(() {
                            _emailErrorMsg = 'Please enter email';
                          });
                          }

                        },


                        // onSaved: (value) => _email = value,


                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        controller:    passwordController ,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter Password',
                            errorText: _passwordErrorMsg

                        ),
                        onChanged: (text) {
                          if( passwordController.text.isNotEmpty ){
                            setState(() {
                            _passwordErrorMsg = null;
                            });
                          }
                          else if(passwordController.text.isEmpty){

                            setState(() {
                              _passwordErrorMsg = 'Please enter password';
                            });
                          }



                        },
                      ),
                    ),


                      Padding(
                          padding: EdgeInsets.all(15),
                    // ignore: deprecated_member_use
                   child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text('Sign In'),
                        onPressed: () async {
                          print('Deepti');
                          print(email.toString());
                          print(password.toString());



      if (emailController.text.isEmpty) {
        setState(() {
     return  _emailErrorMsg = 'Please enter email';
        });
        return false;
      }
      else if( _emailErrorMsg == 'Please enter email'  )
      {
        setState(() {
          _emailErrorMsg = null;
        });}

      else if (passwordController.text.isEmpty) {
        setState(()  {
          _passwordErrorMsg = 'Please enter password';
        });
            return false;

      }





        else if(_passwordErrorMsg =='Please enter password')
        {
          setState(() {
            _passwordErrorMsg = null;

          });
      }

 else
                              Navigator.push(
                              context,
                                MaterialPageRoute(builder: (context) => Home(
                               )),
                            );



                        }
                    )
                      )

    ]
        ),

              ),
            ),
      ),
    );
  }
}
allValidation(BuildContext context, email, password,address, mobileno) {
  RegExp regExp = RegExp(Strings.pattern);
  if (email.isEmpty) {

    return 'Enter email';
  } else if (email.isNotEmpty && !regExp.hasMatch(email.toString().trim()))
  {
    return  "Invalid Email";
  }
  else if (password.toString().trim().isEmpty)
  {
    return  "Enter password";
  }
  else if (password.toString().isNotEmpty &&

      password.toString().trim().length < 6) {
    return "Password length must be 6";
  }
  else if(address.toString().isNotEmpty) {
    return  "Enter address";
  }
  else if (mobileno.toString().trim().isNotEmpty && mobileno.toString().trim().length< 10) {
    return "Enter mobile number ";
  }
  else if(mobileno.toString().trim().length< 10)
  {
    return "Enter valid mobile number ";
  }
  else {
    print("I am getting Error");
  }

}
void showSnackbar(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 4),
  ));
}