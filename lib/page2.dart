
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'package:task99/home.dart';
import 'dart:convert';


class page2 extends StatefulWidget {
   late int x ;
   page2({Key? key, required this.x}) : super(key: key);
  
  
  @override
  State<page2> createState() => _page2();

}
class _page2 extends State<page2> {

List posts = [] ;


Future getpostdetails(int index) async{

 var url = "https://jsonplaceholder.typicode.com/photos?id=$index";
  
  var response = await http.get(Uri.parse(url));
  var responsebody = jsonDecode(response.body) ;

  posts.addAll(responsebody) ;
  setState(() {
    
  });
}

   @override

 void initState() {
      getpostdetails(widget.x);
    super.initState();
  }

  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    
    return SafeArea(
    
      child: Scaffold( backgroundColor: Colors.white,
      appBar: AppBar(
       
        backgroundColor: Colors.blue,
         centerTitle: true,
      bottomOpacity: 0.0,
      elevation: 0.0,
      title: Text("Details 1",textAlign: TextAlign.center,style:
         TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,),), 
         
         ),
         body:
        posts == null || posts.isEmpty 
         ? Center(child: CircularProgressIndicator())
         : ListView.builder(
          itemCount:posts.length ,
          itemBuilder: (context,i){
            return Column(
              children: [Padding(padding: EdgeInsets.only(top: 50)),
                Row(children: [Padding(padding: EdgeInsets.all(10),),
                  Text("ID",style: TextStyle(
                  color: Colors.black ,fontWeight: FontWeight.bold,fontSize: 15),),
                   SizedBox(width: size.width*0.5),
                 Container(
                  child:  Text("${posts[i]["id"]}"),)
                ],),
                 SizedBox( height: size.height*0.10),
                Row(children: [Padding(padding: EdgeInsets.all(10),),
                 Text("AlbumId",style: TextStyle(
                  color: Colors.black ,fontWeight: FontWeight.bold,fontSize: 15),),
                  SizedBox(width: size.width*0.4),
                  Container(
                  child:  Text("${posts[i]["albumId"]}"),)
                ],),
                  SizedBox( height: size.height*0.10),
                Row(children: [Padding(padding: EdgeInsets.all(10),),
                  Text("Title",style: TextStyle(
                  color: Colors.black ,fontWeight: FontWeight.bold,fontSize: 15),),
                  SizedBox(width: size.width*0.3),
                  Container(
                  width: size.width*0.50,
                    child:  Text("${posts[i]["title"]}")
                  )
                ],),
                  SizedBox( height: size.height*0.10),
                 Row(children: [Padding(padding: EdgeInsets.all(10),),
                  Text("Thumbnail",style: TextStyle(
                  color: Colors.black ,fontWeight: FontWeight.bold,fontSize: 15),),
                  SizedBox(width: size.width*0.1),
                  Container(
                  width: size.width*0.28,
                    child:  Text("${posts[i]["thumbnailUrl"]}")
                  ),
                  SizedBox(width: size.width*0.05),
                  SizedBox(width: size.width*0.20,
                  height: size.height*0.11,
                  child: Image.network("${posts[i]["url"]}"),)
                 ],),
                  SizedBox( height: size.height*0.10),
                 Row(children: [Padding(padding: EdgeInsets.all(10),),
                  Text("Image",style: TextStyle(
                  color: Colors.black ,fontWeight: FontWeight.bold,fontSize: 15),),
                  SizedBox(width: size.width*0.2),
                  Container(
                  width: size.width*0.26,
                    child:  Text("${posts[i]["url"]}")
                  ),
                 SizedBox(width: size.width*0.04),
                  SizedBox(width: size.width*0.30,
                 height: size.height*0.13,
                  child: Image.network("${posts[i]["url"]}"),)
                 ],)
              ],
            );
            
            

         }


  )));}        

}
