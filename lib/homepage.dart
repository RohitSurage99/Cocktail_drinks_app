
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget
{
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var myText = "India Wale";


 // const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Center(child: Text("Cocktail_App")),
      ),
         body: Center(

           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Image.network("https://upload.wikimedia.org/wikipedia/commons/b/bc/Flag_of_India.png",
               height: 150, width: 150, ),

               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children:[
                   Text(
                       myText,
                   textScaleFactor: 2.0,),

                   SizedBox(
                     width: 50.0,
                   ),

                   ElevatedButton (
                       onPressed: (){
                         myText = "Hindustani";
                         print(myText);
                         setState(() {

                         });
                       },
                        style: TextButton.styleFrom(
                        backgroundColor: Colors.cyan
                        ),
                       child: Text("Press Me")),
                 ],
               ),
             ],

           ),
         ),

    );
  }
}

