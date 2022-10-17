
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'dart:convert';

import 'package:task99/page2.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}


class _homeState extends State<home> {

  List posts = [] ;

Future getpost() async{

 var url = "https://jsonplaceholder.typicode.com/photos";

  var response = await http.get(Uri.parse(url));
  var responsebody = jsonDecode(response.body) ;

  posts.addAll(responsebody) ;
  setState(() {
    
  });
}
@override
  void initState() {
    getpost();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
           centerTitle: true,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Text("youremail@email.com",textAlign: TextAlign.center,style:
           TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,),)),
        body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return InkWell(child: Card(margin: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 20,
                color: Colors.white,
                child: Container(padding: EdgeInsets.all(20),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Row( crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${posts[index]["id"]}",style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold,fontSize: 15),
                    ),SizedBox(width: size.width*0.05),
                    Container(
                      width: size.width*0.44,
                    child: Text(posts[index]["title"],style: TextStyle(
                          color: Colors.redAccent, fontWeight: FontWeight.bold,fontSize: 15)),),
                          SizedBox(width: size.width*0.09),
                         SizedBox(
                  height: size.height*0.08,
                  child: Image.network("${posts[index]["url"]}"),)// statuscode 403
                        

                  ]

                  ,),

            ]),
        )),
        onTap: () {
           Navigator.push( context, MaterialPageRoute( builder: (context) => page2(x: posts[index]['id'],)));
        },
       );
          },)),
    );
  }
}