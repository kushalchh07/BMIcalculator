import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

var wtController = TextEditingController();
var ftController = TextEditingController();
var inController = TextEditingController();

class _HomePageState extends State<HomePage> {
  var result = "";
  var bgcolor = Colors.purple[100];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgcolor,
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 35, fontFamily: 'Jersey'),
        ),
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 15,
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            height: 450,
            width: 400,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Lets Calculate Your BMI !!!",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Jacquard'),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                      label: Text(
                        "Enter Your Weights (In kgs):",
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            color: Colors.grey.shade900),
                      ),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text("Enter Your Height (In ft):",
                          style: TextStyle(
                              fontWeight: FontWeight.w100,
                              color: Colors.grey.shade900)),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text("Enter Your Height (In Inch):",
                          style: TextStyle(
                              fontWeight: FontWeight.w100,
                              color: Colors.grey.shade900)),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        var Twt = int.parse(wt); //parsed into integer
                        var Tft = int.parse(ft); //parsed into integer
                        var Tinch = int.parse(inch);

                        var TotalheightINinch = Tft * 12 + Tinch;
                        var TM = (TotalheightINinch * 2.54) /
                            100; //TotalheightInMeter
                        var BMI = Twt / (TM * TM);

                        setState(() {
                          if (BMI < 18.5) {
                            result =
                                "Your BMI is ${BMI.toStringAsFixed(2)} & You are Underweight";
                            bgcolor = Colors.red[100];
                          } else if (BMI < 24.9 && BMI > 18.5) {
                            result =
                                "Your BMI is ${BMI.toStringAsFixed(2)} & You are Normalweight";
                            bgcolor = Colors.green[100];
                          } else if (BMI < 29.9 && BMI > 25) {
                            result =
                                "Your BMI is ${BMI.toStringAsFixed(2)} & You are Overweight";
                            bgcolor = Colors.red[200];
                          } else {
                            result =
                                "Your BMI is ${BMI.toStringAsFixed(2)} & You are Extremely Overweight";
                            bgcolor = Colors.red[300];
                          }
                        });
                      } else {
                        setState(() {
                          result = "Please fill up all the area.";
                        });
                      }
                    },
                    child: Text("CALCULATE")),
                SizedBox(
                  height: 3,
                ),
                Container(
                  child: Text(
                    result,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
