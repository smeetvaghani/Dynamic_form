import 'package:flutter/material.dart';

class RetriveDataScreen extends StatefulWidget {
  String text;
  String email;
  String number;
  String address;
  String radioData;
  String dropDownData;
  var cityList;

  RetriveDataScreen(
      {this.text,
      this.email,
      this.address,
      this.number,
      this.radioData,
      this.dropDownData,
      this.cityList});

  @override
  _RetriveDataScreenState createState() => _RetriveDataScreenState();
}

class _RetriveDataScreenState extends State<RetriveDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Form Data"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.text),
            Text(widget.email),
            Text(widget.address),
            Text(widget.number),
            Text(widget.radioData),
            Text(widget.dropDownData),
            Text(widget.cityList.toString()),
          ],
        ),
      ),
    );
  }
}
