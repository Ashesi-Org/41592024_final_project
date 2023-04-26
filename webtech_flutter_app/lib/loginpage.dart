import 'dart:convert';
import 'package:webtech_flutter_app/postpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:webtech_flutter_app/viewprofile.dart';

class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}

TextEditingController idController = TextEditingController();

Map<String, String> profile_data = {};

getRequest() async {

  String id = idController.text;
   final response = await http.get(Uri.parse('http://127.0.0.1:5000/profiles?ID=$id'));

  try {
    final data = jsonDecode(response.body) as Map<String, String>;
    
    return data;
  } catch (e) {
    // handle network or server errors
    print('Error sending request: $e');
  }
}


class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name="";
  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return  Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color(0xFFffffff),
        body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: formKey, //key for form
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Login Page", style: TextStyle(fontSize: 30, color:Color(0xFF363f93)),),
                
                
              


                Expanded (
                child: TextFormField(
                  controller: idController,
                  decoration: InputDecoration(
                    labelText: "Enter your Student ID number"
                  ),
                  validator: (value){
                    if(value!.isEmpty ||!RegExp(r'[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$').hasMatch(value)){
                      return "Enter correct ID";
                    }else{
                      return null;
                    }
                  },
                )
                ),

                SizedBox(height: height * 0.7, ) ,

            
                Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      getRequest();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewProfile(profile: profile_data, profile_data: {},)),);
                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF363f93)
                  ),
                  child: Row (children: [
                    Text(
                      "Login",
                    style: TextStyle(
                      color:Colors.white 
                  )
                )
              ]
              )
            ,)
                )
              ],
            ),
          ),
        )
    );
  }


}