import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class EditProfile extends StatelessWidget{

  Map<String, String> profile;
  EditProfile({required this.profile, super.key});


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
          child: Form(//key for form
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Edit Profile", style: TextStyle(fontSize: 30, color:Color(0xFF363f93)),),
                
                
                Expanded(
                child: TextFormField(
                  initialValue: profile['name'],
                  decoration: InputDecoration(
                    labelText: "Enter your name"
                  ),
                  
                )
                ),


                Expanded (
                child: TextFormField(
                 initialValue: profile['ID'],
                  decoration: InputDecoration(
                    labelText: "Enter your ID"),
                    enabled: false,                  
                  )
                ),

                Expanded(
                child: TextFormField(
                 initialValue: profile['email'],
                  decoration: InputDecoration(
                    labelText: "Enter your email"
                  ),
                  enabled: false,
                )
                ),

                Expanded(
                child: TextFormField(
                  initialValue: profile['Date of Birth'],
                  decoration: InputDecoration(
                    labelText: "Enter your date of birth"
                  ),
                  
                )
                ),

                Expanded(
                child: TextFormField(
                  initialValue: profile['Year Group'],
                  decoration: InputDecoration(
                    labelText: "Enter your year group"
                  ),
                  
                )
                ),

                Expanded(
                child: TextFormField(
                  initialValue: profile['Major'],
                  decoration: InputDecoration(
                    labelText: "Enter your major"
                  ),
                  
                )
                ),

                   SizedBox(height: height*0.04 ,),

                Expanded(
                child: TextFormField(
                  initialValue: profile['campus residence'],
                  decoration: InputDecoration(
                    labelText: "Enter your reesidence"
                  ),
                  
                )
              ),

                SizedBox(height: height*0.04 ,),

                Expanded(   
                child: TextFormField(
                  initialValue: profile['Best Food'],
                  decoration: InputDecoration(
                    labelText: "Enter your food"
                  ),
                 
                )
                ),

                Expanded(
                  child:TextFormField(
                    initialValue: profile['Best Movie'],
                  decoration: InputDecoration(
                    labelText: "Enter your movie"
                  ),
                  
                )
                ),


              ],
            ),
          ),
        )
    );
  }


}