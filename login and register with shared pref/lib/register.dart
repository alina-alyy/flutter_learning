import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final firstNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final middleNameController=TextEditingController();
  final lastNameController=TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> saveUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("email", emailController.text);
    prefs.setString("password", passwordController.text);
    prefs.setString("firstname", firstNameController.text);
    prefs.setString("middlename",middleNameController.text);
    prefs.setString("lastname",lastNameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "logo.png",
                  width: 120,
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.drive_file_rename_outline_rounded),
                      label: Text("First Name"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please type firstname!";
                      }
                    }),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  child: TextFormField(
                      controller: middleNameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.drive_file_rename_outline_rounded),
                        label: Text("Middle Name"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please type firstname!";
                        }
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),TextFormField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.drive_file_rename_outline_rounded),
                      label: Text("last Name"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please type firstname!";
                      }
                    }),
                const SizedBox(height: 15),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_rounded),
                      label: Text("Email"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please type username!";
                    } else if (!validateEmail(value)) {
                      return "Email must end with szabist.edu.pk or szabist.pk";
                    }
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.remove_red_eye),
                        label: Text("Password"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please type password!";
                      } else if (!validatePass(value)) {
                        return "Must start with symbol followed by characters and end with symbol";
                      }
                    }),
                const SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await saveUser();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(180, 50)),
                    child: Text("Register")),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainApp()),
                    );
                  },
                  child: Text("Already registered? Sign in"),
                )
              ],
            )),
      ),
    );
  }

  bool validateEmail(String email) {
    return RegExp(r"^\w+([-+.']\w+)*@?(szabist.edu.pk|szabist.pk)$")
        .hasMatch(email);
  }

  bool validatePass(String pass) {
    return RegExp(r"^[\W_]+[a-zA-Z0-9]+[\W_]+$").hasMatch(pass);
  }
}
