import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/home.dart';
import 'package:untitled/register.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> checkUser() async {
    final prefs = await SharedPreferences.getInstance();
    if (emailController.text == prefs.getString("email") &&
        passwordController.text == prefs.getString("password")) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
                    await checkUser();
                  }
                },
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(180, 50)),
                child: Text("Login")),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Register()),
                );
              },
              child: Text("Are you new here? Join now"),
            )
          ],
        ));
  }

  bool validateEmail(String email) {
    return RegExp(r"^\w+([-+.']\w+)*@?(szabist.edu.pk|szabist.pk)$")
        .hasMatch(email);
  }

  bool validatePass(String pass) {
    return RegExp(r"^[\W_]+[a-zA-Z0-9]+[\W_]+$").hasMatch(pass);
  }
}
