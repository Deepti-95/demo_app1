


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListExample extends StatefulWidget
{
  @override
  _ListExampleState createState() => _ListExampleState();

}

class _ListExampleState extends State<ListExample>
{
// first type initalization with value pass
  List<String> arr = ['one','two','three','four'];
  // only decleartion
  // ignore: deprecated_member_use
  var myList = List(3);
  List<String> ages = ['C++', 'java', 'flutter'];
//  for(String name in names) Cards(unit:name)
  //ages.forEach((String age) => print(age));


// ignore: deprecated_member_use
  // only just decleartion
// ignore: deprecated_member_use
List<String> myarr =  List<String>();
@override
  void initState() {
    takedata();
    super.initState();

  }
  void dispose()
  {
    super.dispose();
    myarr.clear();
  }
  takedata(){
    myarr;
  }
  @override
  Widget build(BuildContext context)
  {

    //*****************
    myarr.add('1');
    myarr.add('2');
    myarr.add('3');
    myarr.add('4');

    for(int i =0 ; i< myarr.length ; i++)
      {
        myList = myarr;
      }

    print('Data of mylist');
    print(myList);
    return MaterialApp(
      home: Scaffold
        (
        appBar :AppBar(
          title: Text('List Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [

                Center(
                  child: Text('Practice of List Examples'),

                ),
          //    Text(arr.toString().trim()),
              Text(myList.toList().toString()),
         //     Text(myarr.toList().toString()),
            ],
          ),
        ),
      ),
    );
  }
}
