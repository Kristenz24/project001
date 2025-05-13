import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Controllers for text fields

  final TextEditingController _firstNameController        = TextEditingController();
  final TextEditingController _lastNameController         = TextEditingController();
  final TextEditingController _emailController            = TextEditingController();
  final TextEditingController _usernameController            = TextEditingController();
  final TextEditingController _passwordController         = TextEditingController();
  final TextEditingController _confirmPasswordController  = TextEditingController();

  Future<void> _createUser() async {
    

    final url = Uri.parse("https://reqres.in/api/users");

    final Map<String, dynamic> requestData = {
      "first_name"        : _firstNameController.text,
      "last_name"         : _lastNameController.text,
      "email"             : _emailController.text,
      "username"             : _usernameController.text,
      "password"          : _passwordController.text,
      "confirm_password"  : _confirmPasswordController.text,

    };

    try {
      final response = await http.post(
        url, 
        headers: { "Content-Type": "application/json" },
        body: jsonEncode(requestData)
      );

      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: 'First Name',
              ),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: 'Last Name',
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true, // Hide the password input
            ),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
              obscureText: true, // Hide the password input
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _createUser,
              child: Text('Create User'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SignUpPage(),
  ));
}
