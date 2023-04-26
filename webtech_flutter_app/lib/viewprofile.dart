import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:webtech_flutter_app/postpage.dart';

class ViewProfile extends StatelessWidget{

  Map<String, String> profile;
  ViewProfile({required this.profile, super.key, required Map<String, String> profile_data});


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
                Text("View Profile", style: TextStyle(fontSize: 30, color:Color(0xFF363f93)),),
                
                
                Expanded(
                child: TextFormField(
                  initialValue: profile['name'],
                  decoration: InputDecoration(
                    labelText: "Jude Jovan"
                  ),
                  enabled: false,
                )
                ),


                Expanded (
                child: TextFormField(
                 initialValue: profile['ID'],
                  decoration: InputDecoration(
                    labelText: "51762024"),
                    enabled: false,                  
                  )
                ),

                Expanded(
                child: TextFormField(
                 initialValue: profile['email'],
                  decoration: InputDecoration(
                    labelText: "jude.lamptey@ashesi.edu.gh"
                  ),
                  enabled: false,
                )
                ),

                Expanded(
                child: TextFormField(
                  initialValue: profile['Date of Birth'],
                  decoration: InputDecoration(
                    labelText: "8/6/2002 "
                  ),
                  enabled: false,
                )
                ),

                Expanded(
                child: TextFormField(
                  initialValue: profile['Year Group'],
                  decoration: InputDecoration(
                    labelText: "2024"
                  ),
                  enabled: false,
                )
                ),

                Expanded(
                child: TextFormField(
                  initialValue: profile['Major'],
                  decoration: InputDecoration(
                    labelText: "Computer Science"
                  ),
                  enabled: false,
                )
                ),

                   SizedBox(height: height*0.04 ,),

                Expanded(
                child: TextFormField(
                  initialValue: profile['campus residence'],
                  decoration: InputDecoration(
                    labelText: "Off-Campus(Hosana)"
                  ),
                  enabled: false,
                )
              ),

                SizedBox(height: height*0.04 ,),

                Expanded(   
                child: TextFormField(
                  initialValue: profile['Best Food'],
                  decoration: InputDecoration(
                    labelText: "Waakye"
                  ),
                 enabled: false,
                )
                ),

                Expanded(
                  child:TextFormField(
                    initialValue: profile['Best Movie'],
                  decoration: InputDecoration(
                    labelText: "Fight Club"
                  ),
                  enabled: false,
                )
                ),

                Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage()),);
                    },
                  
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF363f93)
                  ),
                  child: Row (children: [
                    Text(
                      "Next",
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