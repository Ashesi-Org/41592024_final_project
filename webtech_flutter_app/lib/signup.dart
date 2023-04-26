import 'dart:convert';
import 'package:webtech_flutter_app/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

TextEditingController idController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController dateofbirthController = TextEditingController();
TextEditingController yeargroupController = TextEditingController();
TextEditingController majorController = TextEditingController();
TextEditingController campusresidenceController = TextEditingController();
TextEditingController bestmovieController = TextEditingController();
TextEditingController bestfoodController = TextEditingController();


Future<void> sendPostRequest() async {

  String id = idController.text;
  String name=nameController.text;
  String email=emailController.text;
  String DOB=dateofbirthController.text;
  String yeargroup=yeargroupController.text;
  String major=majorController.text;
  String campusresidence=campusresidenceController.text;
  String bestmovie=bestmovieController.text;
  String bestfood=bestfoodController.text;

  final url = Uri.parse('http://127.0.0.1:5000/profiles');
  final body = {'ID': id,
    'name':name,
    'email':email,
    'Date of Birth':DOB,
    'Year Group':yeargroup,
    'Major':major,
    'Campus Residence':campusresidence,
    'Best Movie':bestmovie,
    'Best Food':bestfood, 
  };
  final headers = {'Content-Type': 'application/json'};
  final encodedBody = jsonEncode(body);
  
  try {
    final response = await http.post(url, body: encodedBody, headers: headers);
    if (response.statusCode == 201) {
      // handle successful response
      print(response.body);
    } else {
      // handle unsuccessful response
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    // handle network or server errors
    print('Error sending request: $e');
  }
}


class _HomeState extends State<Home> {
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
                Text("Create An Account", style: TextStyle(fontSize: 30, color:Color(0xFF363f93)),),
                
                
                Expanded(
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Enter your name"
                  ),
                  validator: (value){
                    if(value!.isEmpty ||!RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                      return "Enter correct name";
                    }else{
                      return null;
                    }
                  },
                )
                ),


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

                Expanded(
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Enter your email"
                  ),
                  validator: (value){
                    if(value!.isEmpty ||!RegExp(r'^[\w\.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(value)){
                      return "Enter correct email";
                    }else{
                      return null;
                    }
                  },
                )
                ),

                Expanded(
                child: TextFormField(
                  controller: dateofbirthController,
                  decoration: InputDecoration(
                    labelText: "Enter your Date Of Birth"
                  ),
                  validator: (value){
                    if(value!.isEmpty ||!RegExp(r'^(0[1-9]|1[0-9]|2[0-9]|3[01]).(0[1-9]|1[012]).([19]{2})?([1-9]{2})+$').hasMatch(value)){
                      return "Enter correct date of birth";
                    }else{
                      return null;
                    }
                  },
                )
                ),

                Expanded(
                child: TextFormField(
                  controller: yeargroupController,
                  decoration: InputDecoration(
                    labelText: "Enter your Year Group"
                  ),
                  validator: (value){
                    if(value!.isEmpty ||!RegExp(r'^[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$').hasMatch(value)){
                      return "Enter correct year group";
                    }else{
                      return null;
                    }
                  },
                )
                ),

                Expanded(
                child: TextFormField(
                  controller: majorController,
                  decoration: InputDecoration(
                    labelText: "Enter your Major"
                  ),
                  validator: (value){
                    if(value!.isEmpty ||!RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                      return "Enter correct major";
                    }else{
                      return null;
                    }
                  },
                )
                ),

                   SizedBox(height: height*0.04 ,),

                Expanded(
                child: TextFormField(
                  controller: campusresidenceController,
                  decoration: InputDecoration(
                    labelText: "Enter your campus residence"
                  ),
                  validator: (value){
                    if(value!.isEmpty ||!RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                      return "Enter correct residence";
                    }else{
                      return null;
                    }
                  },
                )
              ),

                   SizedBox(height: height*0.04 ,),

                Expanded(   
                child: TextFormField(
                  controller: bestfoodController,
                  decoration: InputDecoration(
                    labelText: "Enter your best food"
                  ),
                  validator: (value){
                    if(value!.isEmpty ||!RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                      return "Enter correct food";
                    }else{
                      return null;
                    }
                  },
                )
                ),

                Expanded(
                  child:TextFormField(
                    controller: bestmovieController,
                  decoration: InputDecoration(
                    labelText: "Enter your best movie"
                  ),
                  validator: (value){
                    if(value!.isEmpty ||!RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                      return "Enter correct movie";
                    }else{
                      return null;
                    }
                  },
                )
                ),

                Expanded(
                child: ElevatedButton(
                  onPressed:sendPostRequest,
                  
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF363f93)
                  ),
                  child: Row (children: [
                    Text(
                      "Submit",
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