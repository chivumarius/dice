// Importing the "Material Design" Package:
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// ♦♦ The "main()" Function:
void main() {
  // We "Tell" the "Phone"
  // to "Run" an "Application":
  return runApp(
    // We Specify the Type of Application Returned as:
    MaterialApp(
      // We Give It "Different Widgets" to be "Displayed":
      // ♦ "Scaffold()" Widget:
      home: Scaffold(
        backgroundColor: Colors.grey[850],

        // ♦ The "AppBar()" Widget:
        appBar: AppBar(
          // ♦ The "Text()" Widget:
          title: Center(
            child: Text('Dice'),
          ),
          backgroundColor: Colors.grey[850],
        ),
        body: DicePage(),
      ),
    ),
  );
}

// ♦♦ The "StatefulWidget"
//    → for "Changeable States":
class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // Variables of Specific Data Type "int":
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  // ♦ The "changeDiceFace()" Function:
  void changeDiceFace() {
    // ♦ The "setState(() {})" Method
    //   → for Specifying "Status Upgrade":
    setState(() {
      // ♦ The "Dart:Math" Library
      //    → for "Generating Random Numbers"
      // ♦ The "Random()" Widget
      //   → with the ".nextInt(max)" Method
      //   → we Add "+ 1" → in order Not to Get "0" Value:
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  // ♦ The "build()" Method:
  Widget build(BuildContext context) {
    // ♦ The "Center()" Widg et:
    return Center(
      // ♦ The "Row()" Widget:
      child: Row(
        children: <Widget>[
          // ♦ The "Expanded()" Widget 1
          //  → which Expands a "Child" of a "Row", "Column", or "Flex"
          //  → so that the "Child Fills" the "Available Space":
          Expanded(
            // ♦ "Button" → The "TextButton()" Widget
            //   (→ instead of the "FlatButton()" Depreciated Widget):
            child: TextButton(
              // ♦ Anonymous Function
              // The "onPressed" Property is "Always Required:"
              onPressed: () {
                // ♦ Calling the "changeDiceFace()" Function:
                changeDiceFace();
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),

          // ♦ The "Expanded()" Widget 2:
          Expanded(
            // ♦ "Button" → The "TextButton()" Widget
            //   (→ instead of the "FlatButton()" Depreciated Widget):
            child: TextButton(
              // ♦ Anonymous Function
              // The "onPressed" Property is "Always Required:"
              onPressed: () {
                // ♦ The "setState(() {})" Method
                //   → for Specifying "Status Upgrade":
                // ♦ Calling the "changeDiceFace()" Function:
                changeDiceFace();
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
