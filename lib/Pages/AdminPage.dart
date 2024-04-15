import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  dynamic no = 0;

  String? dropdownValue = 'zip'; // Set default value to 'zip'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADMIN"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width / 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "No. of Records Submitted : ",
                    style: GoogleFonts.aBeeZee(
                        textStyle: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 10),
                  Text(
                    "$no",
                    style: GoogleFonts.aBeeZee(
                        textStyle: TextStyle(fontSize: 18)),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 80),
              Row(
                children: [
                  Text(
                    "Download Records :",
                    style: GoogleFonts.aBeeZee(
                        textStyle: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width /5),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['zip', 'pdf']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
