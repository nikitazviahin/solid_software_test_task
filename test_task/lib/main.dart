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

//we use StatefulWidget as the background will change after every tap
class CustomTile extends StatefulWidget {
  @override
  CustomTileState createState() => CustomTileState();
}

class CustomTileState extends State<CustomTile> {
  //getting a random color
  Color color;
  Color colorGenerator() {
    //we just take random floating value between 0.0 and 1.0, and transform it to integer and then to Color value
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  //flutter calls this object once every time State object is created
  @override
  void initState() {
    super.initState();
    color = colorGenerator();
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      color: color,
      child: InkWell(
        
        //the Container with text and some styles for it
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

        //user taps handler, we use colorGenerator() we created earlier to change background here
        onTap: () {
          setState(() {
            color = colorGenerator();
          });
        }

      ),
    );
  }
}