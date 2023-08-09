// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

//Important Note
//in this form validator i validate the given Form using plugin called
//Form Field Vlidator which i installed from Pub.dev

class FormPage extends StatelessWidget {
  FormPage({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validate() {
    if (formKey.currentState!.validate()) {
      print("ok");
    } else {
      print("Error Occure");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text("Validated Form"),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Center(
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "Email", border: OutlineInputBorder()),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Required"),
                      EmailValidator(errorText: "Please Enter Valid Email"),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password", border: OutlineInputBorder()),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required"),
                        MinLengthValidator(6,
                            errorText:
                                "Password Must Be Atleast Six Character"),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                        onPressed: () {
                          validate();
                        },
                        child: Text("Login")),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
