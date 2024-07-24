import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalorieCalculate extends StatefulWidget {
  CalorieCalculate({super.key});

  @override
  State<CalorieCalculate> createState() => _CalorieCalculateState();
}

class _CalorieCalculateState extends State<CalorieCalculate> {
  var wtController = TextEditingController();
  var ageController = TextEditingController();
  var cmController = TextEditingController();
  var bmr;
  var description = "";

  var _selectedOption = 'Option 1';
  var _choice = 'No Exercise';

  void _onpressed() {
    var wt = wtController.text.toString();
    var age = ageController.text.toString();
    var cm = cmController.text.toString();

    if (wt != "" && age != "" && cm != "") {
      var twt = int.parse(wt); //parsed into integer
      var tage = int.parse(age); //parsed into integer
      var tcm = int.parse(cm);

      setState(() {
        if (_selectedOption == 'Option 1') {
          bmr = (10 * twt) + (6.25 * tcm) - (5 * tage) + 5;
        } else {
          bmr = (10 * twt) + (6.25 * tcm) - (5 * tage) - 161;
        }

        if (_choice == 'No Exerxise') {
          description = (bmr * 1.2).toString();
        } else if (_choice == 'Light Exercise') {
          description = (bmr * 1.375).toString();
        } else if (_choice == 'Moderate Exercise') {
          description = (bmr * 1.55).toString();
        } else if (_choice == 'Hard Exercise') {
          description = (bmr * 1.725).toString();
        } else {
          description = (bmr * 1.9).toString();
        }
      });
    }
    if (wt == "" && age == "" && cm == "") {
      setState(() {
        // Show the SnackBar
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Please fill up all the area.")));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 190, 161),
        title: Text(
          "Calorie calculator",
          style: GoogleFonts.cabin(
            fontWeight: FontWeight.w700,
            fontSize: 35,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[100],
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  height: 400,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, top: 0, bottom: 8.0, right: 12.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: ageController,
                            decoration: InputDecoration(
                              hoverColor: Colors.blue,
                              label: Text(
                                "Age:",
                                style: GoogleFonts.cabin(
                                    fontWeight: FontWeight.w100,
                                    color: Colors.grey.shade900),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          RadioListTile(
                              title: Text('Male'),
                              value: 'Option 1',
                              groupValue: _selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  _selectedOption = value!;
                                });
                              }),
                          RadioListTile(
                              title: Text('Female'),
                              value: 'Option 2',
                              groupValue: _selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  _selectedOption = value!;
                                });
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: cmController,
                            decoration: InputDecoration(
                              label: Text("Height (In Cm):",
                                  style: GoogleFonts.cabin(
                                      fontWeight: FontWeight.w100,
                                      color: Colors.grey.shade900)),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: wtController,
                            decoration: InputDecoration(
                              label: Text("Weight (In kgs):",
                                  style: GoogleFonts.cabin(
                                      fontWeight: FontWeight.w100,
                                      color: Colors.grey.shade900)),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SingleChildScrollView(
                            child: DropdownButton(
                                icon: Icon(Icons.arrow_drop_down),
                                elevation: 8,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                dropdownColor: Colors.white,
                                value: _choice,
                                items: <String>[
                                  'No Exercise',
                                  'Light Exercise',
                                  'Moderate Exercise',
                                  'Hard Exercise',
                                  'Extra Hard'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _choice = newValue!;
                                  });
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                            const Color.fromARGB(255, 33, 190, 161),
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
              ),
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
                            "The amount of Calorioes you need:",
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  description,
                                  style: GoogleFonts.cabin(fontSize: 25),
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
      ),
    );
  }
}
