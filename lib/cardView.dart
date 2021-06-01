import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  CardView({this.image, this.title, this.subtitle = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Wrap(
          children: [ 
            Image.network(image),
            ListTile(
              title: Text(title),
              subtitle: Text(subtitle),
            ),
            new InkWell(
              onTap: () {},
            )
          ],
        ),
      ),
    ); // First card
  }
}
