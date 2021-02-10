import 'dart:developer';
import 'package:dynamic_form/retriveDataScreen.dart';
import 'package:flutter/material.dart';

String gender = "Male";
String dropdownValue = "Surat";
var tmpArray = [];

class DynamicForm extends StatefulWidget {
  @override
  _DynamicFormState createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController textController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  // var radioData;

  List formJson = [
    {
      "type": "text",
      "label": "Enter your name",
      "isRequired": true,
    },
    {
      "type": "email",
      "label": "Enter your email",
      "isRequired": true,
    },
    {
      "type": "number",
      "label": "Enter your mobile Number",
      "isRequired": true,
      "maxLength": 10,
    },
    {
      "type": "multiline",
      "label": "Enter your address",
      "isRequired": false,
      "maxLine": 3,
    },
    {
      "type": "radio",
      "label": "Select your gender",
      "isRequired": true,
      "genderList": ["Male", "Female", "Other"]
    },
    {
      "type": "checkbox",
      "label": "Select your hobbies",
      "hobbiesList": ["Reading", "Travelling", "Writing", "Others"]
    },
    {
      "type": "dropdown",
      "label": "Select your city",
      "isRequired": true,
      "cityList": ["Surat", "Ahmedabad", "Mumbai", "Vadodara", "Other"]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Form"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                for (int i = 0; i < formJson.length; i++) ...[
                  formClass(
                    formData: formJson[i],
                    index: i,
                    textController: formJson[i]["type"] == "text"
                        ? textController
                        : formJson[i]["type"] == "email"
                            ? emailController
                            : formJson[i]["type"] == "number"
                                ? numberController
                                : addressController,

                    // radioData: radioData,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print('hi');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RetriveDataScreen(
                              text: textController.text,
                              address: addressController.text,
                              email: emailController.text,
                              number: numberController.text,
                              radioData: gender,
                              dropDownData: dropdownValue,
                              cityList: tmpArray,
                            ),
                          ));
                    }
                  },
                  child: Text("data"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

// Widget form(
//   String lable,
//   String type,
//   int index,
//   String validation,
//   bool isRequired,
// ) {
//   TextInputType type2;
//   if (type == "text" ||
//       type == "email" ||
//       type == "number" ||
//       type == "multiline") {
//     if (type == 'text') {
//       type2 = TextInputType.text;
//     } else if (type == 'email') {
//       type2 = TextInputType.emailAddress;
//     } else if (type == 'number') {
//       type2 = TextInputType.number;
//     } else if (type == 'multiline') {
//       type2 = TextInputType.multiline;
//     }
//     return TextFormField(
//       decoration: InputDecoration(
//         hintText: lable,
//       ),
//       validator: isRequired == true
//           ? (value) => value.isEmpty ? validation : null
//           : null,
//       keyboardType: type2,
//     );
//   } else if (type == "radio") {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(lable),
//         Row(
//           children: [
//             for (int j = 0;
//                 j < formJson[index]["genderList"].length;
//                 j++) ...[
//               Radio(
//                 value: formJson[index]["genderList"][j],
//                 groupValue: gender,
//                 onChanged: (value) {
//                   setState(() {
//                     gender = value;
//                   });
//                 },
//               ),
//               Text(formJson[index]["genderList"][j]),
//             ]
//           ],
//         ),
//       ],
//     );
//   } else if (type == "checkbox") {
//     List<bool> valueList = [];
//     for (int j = 0; j < formJson[index]["hobbiesList"].length; j++) {
//       valueList.add(true);
//       log("aaa");
//     }
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(lable),
//         Row(
//           children: [
//             for (int j = 0;
//                 j < formJson[index]["hobbiesList"].length;
//                 j++) ...[
//               Checkbox(
//                 value: valueList[j],
//                 onChanged: (value) {
//                   log(value.toString());
//                   valueList[j] = value;
//                   log("${valueList[j]}");
//                 },
//               ),
//               Text(formJson[index]["hobbiesList"][j]),
//             ]
//           ],
//         ),
//       ],
//     );
//   } else if (type == "dropdown") {
//     return DropdownButton(
//       items: <DropdownMenuItem<String>>[
//         for (int j = 0; j < formJson[index]["cityList"].length; j++) ...[
//           DropdownMenuItem(
//             child: Text(formJson[index]["cityList"][j]),
//           )
//         ],
//       ],
//       onChanged: (value) {},
//     );
//   }
// }
}

class formClass extends StatefulWidget {
  Map<String, dynamic> formData;
  int index;
  TextEditingController textController;

  formClass({
    this.formData,
    this.index,
    this.textController,
  });

  @override
  _formClassState createState() => _formClassState();
}

class _formClassState extends State<formClass> {
  List<bool> valueList = [];

  // String gender = "Male";
  // String dropdownValue = "Surat";

  @override
  void initState() {
    if (widget.formData["type"] == "checkbox")
      for (int j = 0; j < widget.formData["hobbiesList"].length; j++) {
        valueList.add(false);
      }
  }

  @override
  Widget build(BuildContext context) {
    TextInputType type2;
    if (widget.formData["type"] == "text" ||
        widget.formData["type"] == "email" ||
        widget.formData["type"] == "number" ||
        widget.formData["type"] == "multiline") {
      if (widget.formData["type"] == 'text') {
        type2 = TextInputType.text;
      } else if (widget.formData["type"] == 'email') {
        type2 = TextInputType.emailAddress;
      } else if (widget.formData["type"] == 'number') {
        type2 = TextInputType.number;
      } else if (widget.formData["type"] == 'multiline') {
        type2 = TextInputType.multiline;
      }
      return TextFormField(
        decoration: InputDecoration(
          hintText: widget.formData["label"],
        ),
        validator: widget.formData["isRequired"] == true
            ? (value) => value.isEmpty ? "Please input this field" : null
            : null,
        keyboardType: type2,
        controller: widget.textController,
      );
    } else if (widget.formData["type"] == "radio") {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.formData["label"]),
          Row(
            children: [
              for (int j = 0;
                  j < widget.formData["genderList"].length;
                  j++) ...[
                Radio(
                  value: widget.formData["genderList"][j],
                  groupValue: gender,
                  onChanged: (rvalue) {
                    setState(() {
                      gender = rvalue;
                    });
                  },
                ),
                Text(widget.formData["genderList"][j]),
              ]
            ],
          ),
        ],
      );
    } else if (widget.formData["type"] == "checkbox") {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.formData["label"]),
          Wrap(
            children: [
              for (int j = 0;
                  j < widget.formData["hobbiesList"].length;
                  j++) ...[
                Row(
                  children: [
                    Checkbox(
                      value: valueList[j],
                      onChanged: (cvalue) {
                        if (cvalue) {
                          tmpArray.add(widget.formData["hobbiesList"][j]);
                        } else
                          tmpArray.remove(widget.formData["hobbiesList"][j]);
                        setState(() {
                          valueList[j] = cvalue;
                        });
                      },
                    ),
                    Text(widget.formData["hobbiesList"][j]),
                  ],
                )
              ]
            ],
          ),
        ],
      );
    } else if (widget.formData["type"] == "dropdown") {
      return DropdownButton(
        items: <DropdownMenuItem<String>>[
          for (int j = 0; j < widget.formData["cityList"].length; j++) ...[
            DropdownMenuItem(
              value: widget.formData["cityList"][j],
              child: Text(
                widget.formData["cityList"][j],
              ),
            )
          ],
        ],
        value: dropdownValue,
        onChanged: (dvalue) {
          setState(() {
            dropdownValue = dvalue;
          });
          log(dropdownValue);
        },
      );
    }
  }
}
