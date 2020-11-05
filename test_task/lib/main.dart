import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CustomTile()
        ),
      ),
    );
  }
}

class CustomTile extends StatefulWidget {
  @override
  CustomTileState createState() => CustomTileState();
}

class CustomTileState extends State<CustomTile> {
  Color color;
  @override
  void initState() {
    super.initState();
    color = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      color: color,
      child: InkWell(
        
        child: Container(
          child: Center(
            child: Container(
              padding: new EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black)
              ),
              child: Text(
                "Hey there",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600,
                                 fontSize: 40,
                                ),
              ),
              ),
          )
        ),

        onTap: () {
          setState(() {
            color = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
          });
        }

      ),
    );
  }
}