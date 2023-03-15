// ignore_for_file: prefer_const_constructors, camel_case_types, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nyt/fetch/News.dart';
import 'package:nyt/newsContent.dart';
import 'package:nyt/settings.dart';

class newsPage extends StatefulWidget {

  @override
  State<newsPage> createState() => _newsPageState();
}

class _newsPageState extends State<newsPage> {
  bool themeIsLight = true;
  List data=[];
  bool logedIn = true;
  int total = 1;
  Map info = {};
  double tot = 0.0;

  fetchData()async{
      data = await fetchNewsFunc();
  } 

  @override
  void initState() {
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {

    Color bg_color = themeIsLight ? Colors.white : Colors.black;
    Color tile_color = themeIsLight ? Colors.white : Colors.black;
    Color text_color = themeIsLight ? Colors.black : Colors.white;
    Color appBar_color = themeIsLight ? Colors.teal : Colors.black;

    return Scaffold(
      backgroundColor: bg_color,
      drawer: Container(
        constraints: BoxConstraints(),
        child: Drawer(
          backgroundColor: bg_color,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
                DrawerHeader(
                decoration: BoxDecoration(
                  color: bg_color,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    logedIn ? Center(
                      child: CircleAvatar(
                        radius: 48,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48),
                            image: DecorationImage(
                              image: AssetImage('assets/dp.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    )
                    :
                    Center(
                      child: CircleAvatar(
                        backgroundColor: text_color,
                        radius: 40,
                        child: Icon(Icons.person,color: bg_color,size: 50,),
                      ),
                    ),
                    SizedBox(height: 7),
                    logedIn? Text(
                      'titohkaris@tryapp.com',
                      style: TextStyle(
                        fontFamily: 'Rancho',
                        color: text_color,
                        letterSpacing: 1.5,
                        fontSize: 15,
                      ),
                    )
                    :
                    Text(
                      'example@gmail.com',
                      style: TextStyle(
                        fontFamily: 'Rancho',
                        color: text_color,
                        letterSpacing: 1.5,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 3),
                    logedIn ? Text(
                      '+254 742143102',
                      style: TextStyle(
                        fontFamily: 'Rancho',
                        color: text_color,
                        letterSpacing: 1.5,
                        fontSize: 12,
                      ),
                    )
                    :
                    Text(
                      '+254 712345678',
                      style: TextStyle(
                        fontFamily: 'Rancho',
                        color: text_color,
                        letterSpacing: 1.5,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              themeIsLight ? ListTile(
                tileColor: bg_color,
                title: Text(
                  'Dark Theme',
                  style: TextStyle(
                    fontFamily: 'Rancho',
                    color: text_color,
                    letterSpacing: 1.5,
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  setState(() {
                    themeIsLight = false;
                  });
                  Navigator.pop(context);
                },
              )
              :
              ListTile(
                tileColor: bg_color,
                title: Text(
                  'Light Theme',
                  style: TextStyle(
                    fontFamily: 'Rancho',
                    color: text_color,
                    letterSpacing: 1.5,
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  setState(() {
                    themeIsLight = true;
                  });
                  Navigator.pop(context);
                },
              ),
              logedIn ? ListTile(
                title: Text(
                  'Log Out', 
                  style: TextStyle(
                    fontFamily: 'Rancho',
                    color: text_color,
                    letterSpacing: 1.5,
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  setState(() {
                    logedIn = false;
                  });
                  Navigator.pop(context);
                },
              ):
              ListTile(
                title: Text(
                  'Log In', 
                  style: TextStyle(
                    fontFamily: 'Rancho',
                    color: text_color,
                    letterSpacing: 1.5,
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  setState(() {
                    logedIn = true;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: text_color,
                    ),
                    SizedBox(width: 15),
                    Text(
                      'About', 
                      style: TextStyle(
                        fontFamily: 'Rancho',
                        color: text_color,
                        letterSpacing: 1.5,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> Settings()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      appBar:AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        backgroundColor: appBar_color,
        actions:[
          IconButton(
            onPressed:(){ fetchData();
            },
            icon:Icon(Icons.refresh),
          )
        ],
        title: Text(
          'USA Right Now',
          style: TextStyle(
            fontFamily: 'PlayfairDisplay',
            fontSize: 23,
            letterSpacing: 2,
            color: Colors.white,
          ),
        ),
      ),

      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red,
                backgroundColor: Colors.white,
              )
            );
          }

          if(!snapshot.hasData){
            return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context,int index){
              return Column(
                children: data.map((item) => Card( 
                color: tile_color,
                child:ListTile(
                  textColor: text_color,
                  onTap: ()=> Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> Content(
                      instance: item,
                    )),
                  ),
                  title:Text(
                    item.title!,
                    style: TextStyle(
                      fontFamily: 'Rancho',
                      fontSize: 18,
                      color: text_color,
                    ),
                  ),
                  leading: Icon(
                    Icons.newspaper,
                    color: Colors.red[400],
                    size: 30,
                  ),
                )
              )).toList(),
            );});
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
                backgroundColor: Colors.white,
              )
            );
          }
        }
      ),
    );
  } 
}

// class Display extends StatefulWidget {

//   @override
//   State<Display> createState() => _DisplayState();
// }

// class _DisplayState extends State<Display> {
//   bool themeIsLight = true;
//   List data=[];
//   bool logedIn = true;
//   Map info = {};
//   int total = 1;

//   fetchData()async{
//   data= await fetchNewsFunc();
//     setState((){});
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//     Fluttertoast.showToast(
//       msg: '100+ results found.',
//       fontSize: 20,
//       gravity: ToastGravity.TOP,
//     );
//   }   
//   @override
//   Widget build(BuildContext context) {
//     Color bg_color = themeIsLight ? Colors.white : Colors.black;
//     Color tile_color = themeIsLight ? Colors.white : Colors.black;
//     Color text_color = themeIsLight ? Colors.black : Colors.white;
//     Color appBar_color = themeIsLight ? Colors.teal : Colors.black;

//     return ListView.builder(
//       itemCount: 100,
//       itemBuilder: (BuildContext context,int index){
//         return Column(
//           children: data.map((item) => Card( 
//           color: tile_color,
//           child:ListTile(
//             textColor: text_color,
//             onTap: ()=> Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context)=> Content(
//                 instance: item,
//               )),
//             ),
//             title:Text(
//               item.title!,
//               style: TextStyle(
//                 fontFamily: 'Rancho',
//                 fontSize: 18,
//                 color: text_color,
//               ),
//             ),
//             leading: Icon(
//               Icons.newspaper,
//               color: Colors.red[400],
//               size: 30,
//             ),
//           )
//         )).toList(),
//         );
//       },
//     );
//   }
// }