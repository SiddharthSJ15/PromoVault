import 'package:flutter/material.dart';
import 'package:promo_vault/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  Future<void> _submit() async {
    String? email = _emailController.text.trim();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');

    if (_formKey.currentState!.validate()) {
      if (email == savedEmail) {}
    }
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    // final RegExp emailRegex = RegExp(
    //   r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    // );

    // if (!emailRegex.hasMatch(value)) {
    //   return 'Enter a valid email address';
    // }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
        ),
        title: Text(
          'Forgot Password',
          style: TextStyle(fontFamily: 'GalanoGrotesqueBold', fontSize: 15),
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "Don't worry! we got you covered. Please enter you email address to recover your password.",
              style: TextStyle(
                fontFamily: 'GalanoGrotesqueMedium',
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30),
            Image.asset('assets/images/forgot_password.png', width: 250),

            SizedBox(height: 30),

            TextFormField(
              controller: _emailController,
              validator: emailValidator,
              decoration: InputDecoration(
                hintText: 'Enter your mail',
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.mail_outline_rounded),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: _submit,
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
          ],
        ),
      ),
    );
  }
}
