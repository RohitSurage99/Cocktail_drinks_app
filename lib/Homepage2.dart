import 'dart:convert';

import 'package:coctail_app/drink_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';




class Homepage2 extends StatefulWidget {

  const Homepage2({Key? key}) : super(key: key);

  @override
  State<Homepage2> createState() => _Homepage2State();
}

class _Homepage2State extends State<Homepage2> {

 var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
var res, drinks;

  @override

  void initState() {

    super.initState();
    fetchData();
  }
fetchData() async {
res = await http.Client().post(Uri.parse(api));
//print(res.body);

drinks = jsonDecode(res.body)['drinks'];
  print(drinks.toString());
setState(() {

});
}

@override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors:[Colors.red,Colors.orange] )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Center(child: Text('Cocktail App')),
        ),
            body: Center(
                child: res !=null? ListView.builder(
                  itemCount: drinks.length,
                  itemBuilder: (context, index)
                  {
                    var drink = drinks[index];
                   return ListTile(
                     leading: Hero(
                       tag: drink["idDrink"],
                       child: CircleAvatar(
                         backgroundImage: NetworkImage(
                             drink["strDrinkThumb"] ??
                             "https://filestore.community.support.microsoft.com/api/images/ext?url=https%3a%2f%2fanswerscdn.microsoft.com%2fstatic%2fimages%2fimage-not-found.jpg"
                         ),
                       ),
                     ),
                     title: Text
                    ( '${drink ['strDrink']}',
                  style: const TextStyle(
                    fontSize: 22,color: Colors.white
                    ),
                     ),

                     subtitle: Text
                       ( '${drink ['idDrink']}',
                       style: const TextStyle(
                         color: Colors.white
                       ),
                     ),
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => DrinkDetail(drink: drink,)));
                     },
                   );
                },
                ):SpinKitFadingFour(
                  size: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? Colors.blue : Colors.orange,
                      ),
                    );
                  },
                )

        // CircularProgressIndicator(
                //   color: Colors.black,
                // ),

              ),

      ),
    );
  }
}



