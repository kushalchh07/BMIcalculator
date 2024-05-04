import 'dart:js';
import 'package:google_fonts/google_fonts.dart';
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
  var description = "";
  var bgcolor = Colors.purple[100];

  @override
  Widget build(BuildContext context) {
    void _onpressed() {
      var wt = wtController.text.toString();
      var ft = ftController.text.toString();
      var inch = inController.text.toString();

      if (wt != "" && ft != "" && inch != "") {
        var Twt = int.parse(wt); //parsed into integer
        var Tft = int.parse(ft); //parsed into integer
        var Tinch = int.parse(inch);

        var TotalheightINinch = Tft * 12 + Tinch;
        var TM = (TotalheightINinch * 2.54) / 100; //TotalheightInMeter
        var BMI = Twt / (TM * TM);

        setState(() {
          if (BMI < 18.5) {
            result = "${BMI.toStringAsFixed(2)}";
            description = "Underweight";
          } else if (BMI < 24.9 && BMI > 18.5) {
            result = "${BMI.toStringAsFixed(2)}";
            description = "Normalweight";
          } else if (BMI < 29.9 && BMI > 25) {
            result = "${BMI.toStringAsFixed(2)}";
            description = "Overweight";
          } else {
            result = result = "${BMI.toStringAsFixed(2)}";
            description = "Extremly Overweight";
          }
        });
      }
      if (wt == "" && ft == "" && inch == "") {
        setState(() {
          // Show the SnackBar
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Please fill up all the area.")));
        });
      }
    }

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 190, 161),
        title: Text(
          "BMI Calculator",
          style: GoogleFonts.cabin(
            fontWeight: FontWeight.w700,
            fontSize: 35,
            color: Colors.white,
          ),
        ),
        // centerTitle: true,
        // shadowColor: Colors.black,
        // elevation: 15,
      ),
      body: Container(
        color: Colors.grey[100],
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Lets Calculate Your BMI !!!",
                  style: GoogleFonts.cabin(
                      fontSize: 30,
                      fontWeight: FontWeight.w200,
                      color: Colors.grey[850]),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
            ),
            Material(
              elevation: 10,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                height: 300,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: wtController,
                          decoration: InputDecoration(
                              label: Text(
                                "Enter Your Weights (In kgs):",
                                style: GoogleFonts.cabin(
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
                                  style: GoogleFonts.cabin(
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
                                  style: GoogleFonts.cabin(
                                      fontWeight: FontWeight.w100,
                                      color: Colors.grey.shade900)),
                              prefixIcon: Icon(Icons.height)),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 33, 190, 161),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Button border radius
                    ),
                    fixedSize: Size(400, 50) // Text color
                    ),
                onPressed: () {
                  _onpressed();
                },
                child: Text(
                  "CALCULATE",
                  style: GoogleFonts.cabin(fontSize: 16),
                )),
            SizedBox(
              height: 11,
            ),
            Container(
              width: 400,
              height: 150,
              child: Card(
                child: Column(
                  children: [
                    Container(
                      height: 45,
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Result",
                          style: GoogleFonts.cabin(fontSize: 20),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "BMI",
                                style: GoogleFonts.cabin(fontSize: 20),
                              ),
                              Divider(
                                thickness: 0.5,
                                color: Colors.black,
                              ),
                              Text(
                                result,
                                style: GoogleFonts.cabin(fontSize: 17),
                              )
                            ],
                          ),
                          VerticalDivider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                          Column(
                            children: [
                              Text(
                                "Description",
                                style: GoogleFonts.cabin(),
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.black,
                              ),
                              Text(
                                description,
                                style: GoogleFonts.cabin(fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
