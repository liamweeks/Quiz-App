import 'package:flutter/material.dart';
import 'package:first_app/cardView.dart';

class Home extends StatelessWidget {
  final listOfColours = [
    Colors.blue,
    Colors.orange,
    Colors.deepPurple,
    Colors.amber
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            autofocus: true,
            decoration: InputDecoration(
                hintText: " Search...",
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                )),
            style: TextStyle(color: Colors.black, fontSize: 14.0),
          ),
          iconTheme: IconThemeData(color: Color.fromRGBO(9, 133, 46, 100)),
          backgroundColor: Colors.white,
          actions: <Widget>[
            // IconButton(
            //   icon: Icon(
            //     Icons.shopping_cart,
            //     color: Color.fromRGBO(9, 133, 46, 100),
            //   ),
            //   onPressed: () {
            //     print('klikniete');
            //   },
             //),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.green, Colors.blue])),
          child: Column(children: [
            Text("Popular", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.start),
            Container(
              // cards
              //   decoration: BoxDecoration(
              // borderRadius: BorderRadius.only(
              //     topRight: Radius.circular(40.0),
              //     bottomRight: Radius.circular(40.0),
              //     topLeft: Radius.circular(40.0),
              //     bottomLeft: Radius.circular(40.0))),
              margin: EdgeInsets.symmetric(vertical: 2.0),
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                 CardView(image: "https://variety.com/wp-content/uploads/2020/07/huc-ff-000185.jpg", title: "The Mandalorian"),
                 CardView(image: "https://live.staticflickr.com/4865/32053478698_01542c8dca_b.jpg", title: "Forza: Horizon 4"),
                 CardView(image: "https://wallpaperaccess.com/full/2085473.jpg", title: "Halo")

                ],
              ),
            )
          ]),
        ));
  }
}
