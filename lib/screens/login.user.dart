import 'package:flutter/material.dart';
import 'package:taxi_clone/widgets/loginForm.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Image.asset('assets/image/image1.png'),
                ),
                Container(
                  height: 280,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 5, offset: Offset(5, 5))],
                      color: const Color.fromARGB(255, 230, 224, 224),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Let`s begin the ride..!',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      LoginForm()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
