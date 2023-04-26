import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:webtech_flutter_app/feedpage.dart';
class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final formKey = GlobalKey<FormState>(); //key for form
  String name = "";
  String description = "";

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create A Post",
                style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
              ),

              SizedBox(height: height * 0.03),

              Expanded(
                child: TextFormField(
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

              SizedBox(height: height * 0.03),

              Expanded(
                child: TextFormField(
                  maxLines: 5,
                  maxLength: 200,
                  decoration: InputDecoration(
                      labelText: "Enter your feed (max 200 words)"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter post description";
                    } else if (value.length > 200) {
                      return "Post description must be 200 words or less";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    description = value;
                  },
                ),
              ),

              SizedBox(height: height * 0.4),
              

              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FeedPage()),);
                  },
                  style: ElevatedButton.styleFrom(

                      backgroundColor: Color(0xFF363f93)),
                  child: Row(children: [
                    Text("Submit",
                        style: TextStyle(color: Colors.white))
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
