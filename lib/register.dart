import 'package:flutter/material.dart';
import 'package:promo_vault/const.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello',
                    style: TextStyle(
                      fontFamily: 'GalanoGrotesqueBold',
                      fontSize: 45,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    'there!',
                    style: TextStyle(
                      fontFamily: 'GalanoGrotesqueBold',
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Go ahead and sign in to your account',
                    style: TextStyle(
                      fontFamily: 'GalanoGrotesqueMedium',
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 30),

                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter your mail',
                      // labelText: 'Mail',
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.mail_outline_rounded),
                    ),
                  ),

                  SizedBox(height: 10),

                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      // labelText: 'Password',
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                    ),
                  ),

                  SizedBox(height: 10),

                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Re-enter password',
                      // labelText: 'Password',
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                    ),
                  ),

                  SizedBox(height: 10),

                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontFamily: 'GalanoGrotesqueMedium',
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.deepOrange.shade500,
                      minimumSize: Size(double.infinity, 56),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'GalanoGrotesqueMedium',
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(child: Divider()),
                      SizedBox(width: 10),
                      Text('Or', style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 10),
                      Expanded(child: Divider()),
                    ],
                  ),

                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      minimumSize: Size(double.infinity, 56),
                      side: BorderSide(color: Colors.grey, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/google.png', width: 20),
                        SizedBox(width: 10),
                        Text(
                          'Continue with google',
                          style: TextStyle(fontFamily: 'GalanoGrotesqueMedium'),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(fontFamily: 'GalanoGrotesqueMedium'),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Create an Account",
                          style: TextStyle(
                            color: Colors.deepOrange.shade500,
                            fontFamily: 'GalanoGrotesqueMedium',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}