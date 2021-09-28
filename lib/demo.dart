import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_11/flutter_txt_fields.dart';

import 'main.dart';
import 'my_form.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {

  Choice _selectedOption = choices[0];
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  String msg = 'Flutter - Raised Button';
  int count =0;
  String dropdownvalue = 'Apple';
  var items =  ['Apple','Banana','Grapes','Orange','watermelon','Pineapple'];
  get onPressed => null;
  void _select(Choice choice) {
    setState(() {
      _selectedOption = choice;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text('My App'),
          actions: [
            PopupMenuButton(
                color: Colors.white,
                elevation: 20,
                enabled: true,
                onSelected: (value) {
                  setState(() {
                    //  choices = value;
                  });
                },
                itemBuilder:(context) =>[
                  PopupMenuItem(
                    child: Text('First') ,
                  ),
                  PopupMenuItem(
                    child: Text('Second') ,
                  ),
                  PopupMenuItem(
                    child: Text('Third') ,
                  ),
                ]
            ),
          ],

        ),
        body: Form(
          key: _scaffoldkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Flat Button',style: txtstyle,),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TextFields()),
                        );
                      },
                      child: Text('TextButton',style: btnstyle,),
                    ),
                  ],
                ),




                Row(
                  children: [
                    Text('Floating Action Button  ',style: txtstyle,),
                    FloatingActionButton.extended(

                      onPressed: () {},
                      icon: Icon(Icons.account_circle),
                      label: Text("Profile"),
                    ),
                  ],
                ),
                // ignore: deprecated_member_use
                Row(
                  children: [
                    Text('Raised Button',style: txtstyle,),
                    // ignore: deprecated_member_use
                    RaisedButton(

                      child: Text("Click Here", style: TextStyle(fontSize: 20),),
                      onPressed: _changeText,
                      color: Colors.red,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.grey,
                    ),
                  ],
                ),

                Row(
                  children: [
                    Text('InkWell',style: txtstyle,),
                    SizedBox(width :20),
                    InkWell(
                      child:Icon(Icons.ring_volume, size: 40),
                      focusColor: Colors.amberAccent,
                      splashColor: Colors.grey,
                      highlightColor: Colors.redAccent,

                      onTap: (){
                        setState(() {
                          count += 2;
                        });
                      },
                    ),
                  ],
                ),


                // ignore: deprecated_member_use
                Row(
                  children: [

                    Text('Outline Button',style: txtstyle,),
                    // ignore: deprecated_member_use
                    OutlineButton(
                        color: Colors.grey,
                        child: Text('Outline Button '),
                        onPressed: (){
                          setState(() {

                          });
                        }

                    ),
                  ],
                ),
                // ignore: deprecated_member_use
                Row(
                  children: [
                    Text ('Drop down Button',style: txtstyle,),
                    SizedBox(
                      width: 10,
                    ),
                    DropdownButton(
                      // inital value
                      value: dropdownvalue,
                      icon: Icon(Icons.keyboard_arrow_down),
                      //Array list of item
                      items:  items.map((String items) {
                        return DropdownMenuItem(
                            value: items,
                            child: Text(items)
                        );
                      }
                      ).toList(),
                      onChanged: (String newValue){
                        // Drop down option select
                        setState(() {
//           change selected value
                          dropdownvalue = newValue;
                        });
                      },
                    ),

                  ],
                ),
              ],
            ),
          ),
        ));
  }
  _changeText() {
    setState(() {
      if (msg == 'Flutter - Raised Button') {
        msg = 'Changed the Text';
      } else {
        msg = 'Flutter - Raised Button';
      }
    });
  }
}
class Choice {
  const Choice({this.name, this.icon});
  final String name;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(name: 'Wi-Fi', icon: Icons.wifi),
  const Choice(name: 'Bluetooth', icon: Icons.bluetooth),
  const Choice(name: 'Battery', icon: Icons.battery_alert),
  const Choice(name: 'Storage', icon: Icons.storage),
];

TextStyle txtstyle = new TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 20,

);
TextStyle btnstyle = new TextStyle(
  color : Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 18,

);