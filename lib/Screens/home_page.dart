import 'package:api_get_data_4/Models/app_info.dart';
import 'package:api_get_data_4/Services/api_manager.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   List<AlbumModel>? posts;




@override
 void initState() {
  super.initState();
   mydata();
}

  void mydata() async{
    posts = await Api_Manager().TestData();
  }

int ? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Api Testing"),
      ),
      body: ListView.builder(
         itemCount:posts?.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    selected=index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    //color: Colors.white,
                      color:selected==index? Colors.amber:Colors.white,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: [
                      BoxShadow(
                     color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurStyle: BlurStyle.solid,
                        blurRadius: 5,
                        offset: Offset(0,0),

                      ),
                    ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Row(
                         children: [
                           Container(
                             height: 60,
                             width: 60,
                             decoration:BoxDecoration(
                               color: selected==index?Colors.white: Colors.amber,
                               borderRadius: BorderRadius.circular(7),
                             ),
                             child: Center(
                               child: Text(posts![index].id.toString()),
                             ),
                           ),
                           SizedBox(width: 10,),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Row(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text("NAME: "),
                                   Container(
                                     width: 200,
                                       //color: Colors.yellow,
                                       child: Text(posts![index].name)),
                                 ],
                               ),
                               Row(
                                 children: [
                                   Text("Email: ",
                                   ),
                                   Text(posts![index].email),
                                 ],
                               ),
                             ],
                           ),
                         ],
                       ),
                      //Container(child: Text(posts![index].body ?? "")),
                    ],
                  ),
                ),
              ),
            );
          }
          ),
    );
  }
}
