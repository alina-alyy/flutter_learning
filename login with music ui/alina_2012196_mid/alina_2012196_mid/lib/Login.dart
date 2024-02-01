import 'package:alina_2012196_mid/home.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final pFirstNameController = TextEditingController();
  final pLastNameController = TextEditingController();
  final emailController = TextEditingController();

  String error="";
  String error1="";
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 18, left: 8, right: 8, bottom: 14),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Name:",
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: pFirstNameController,
                        decoration: InputDecoration(
                          labelText: "First",
                          hintText: "First Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please type first name!";
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextFormField(
                          controller: pLastNameController,
                          decoration: InputDecoration(
                            labelText: "Last",
                            hintText: "Last Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please type last name!";
                            }
                          }),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Email:"),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "a@gmail.com",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please type email!";
                    }

                    if (!validateEmail(value)) {
                      return "Email not correct format";
                    }

                  },
                  onChanged: (value){
                    if (!validateEmail(value)) {
                      setState(() {
                        error= "Email not correct format";
                      });

                    }
                    else{

                      setState(() {
                        error= "";
                      });
                    }
                  },

                ),
                Text(error),
                SizedBox(
                  height: 10,
                ),
                Text("Birth Date:"),
                SizedBox(
                  height: 5,
                ),
                TextFormField(

                  decoration: InputDecoration(
                    labelText: "MM/DD/YY",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),

                ),
                SizedBox(
                  height: 20,

                ),


                Text("Password:"),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  obscuringCharacter: "-",
                   obscureText: true,
                  maxLength: 10,
                  decoration: InputDecoration(
                    labelText: "password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  validator: (value){
                    if (value==null|| value.isEmpty){
                      return "password is required";
                    }
                    if(!validatepassword(value)){
                      return "password lenght be max 10 should should contain 5 digit with 1 symbol and characters";
                    }},
                  onChanged: (value){
                    if (!validatepassword(value)) {
                      setState(() {
                        error1= "password lenght be max 10 should contain 5 digit with 1 symbol and characters";
                      });

                    }
                    else{

                      setState(() {
                        error1= "";
                      });
                    }
                  },

                ),

                Text(error1),
                SizedBox(
                  height: 10,
                ),


                ElevatedButton(
                  onPressed: () async {
                    SharedPreferences _prefs =
                    await SharedPreferences.getInstance();
                    if (_formKey.currentState!.validate()) {
                      _prefs.setString("fullName",
                          "${pFirstNameController.text} ${pLastNameController.text}");
                      _prefs.setString("email", emailController.text);
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return home();
                        },
                      ));
                    }
                  },
                  child: Text("Submit"),
                  style: ElevatedButton.styleFrom(fixedSize: Size(100, 40),backgroundColor: Colors.black),
                )
              ],
            ),
          ),
        ));
  }

  bool validateEmail(String email) {
    return RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
        .hasMatch(email);
  }
  bool validatepassword(String password) {
    return RegExp(r"^(?=(?:[^\d]*\d){5})(?=(?:[^\W_]*[\W_]){1})[A-Za-z\d\W_]*$")
        .hasMatch(password);
  }

}
