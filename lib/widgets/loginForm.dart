import 'package:flutter/material.dart';
import 'package:taxi_clone/widgets/locator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      
      String email = _emailController.text;
      String name = _nameController.text;
      print('Email: $email');
      print('Password: $name');
      LocatorWidget.fetchPosition();
      Navigator.pushNamed(context, "/home");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 10),
                      gapPadding: 5,
                      borderRadius: BorderRadius.circular(15)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Colors.black)),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                else if(value.toString() != 'userone@example.com'){
                  return 'incorrect email';
                }
                
                return null;
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 10),
                    gapPadding: 5,
                    borderRadius: BorderRadius.circular(15)),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                disabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelStyle: TextStyle(
                    fontFamily: 'Poppins', fontSize: 18, color: Colors.black),
                labelText: 'name',
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                else if (value.toString() != 'User One'){
                  return 'name is incorrect';
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(80, 35), elevation: 7),
                onPressed: _login,
                child: Text(
                  'Login',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
