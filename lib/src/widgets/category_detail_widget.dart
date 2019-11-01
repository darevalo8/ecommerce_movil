import 'package:flutter/material.dart';

class CategoryDetail extends StatelessWidget {
  String image, title;

  CategoryDetail({this.image, this.title});
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 130.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fitHeight),
      ),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: Colors.black.withOpacity(0.3),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 10.0),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Gotik",
                fontSize: 15.5,
                letterSpacing: 0.7,
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
    );
  }
}