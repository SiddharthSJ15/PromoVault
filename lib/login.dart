import 'package:flutter/material.dart';
import 'package:promo_vault/bottom_nav.dart';
import 'package:promo_vault/const.dart';
import 'package:promo_vault/forgot_password.dart';
import 'package:promo_vault/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool passwordVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisible = false;
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Future<void> _login() async {

    String? email = _emailController.text.trim();
    String? password = _passwordController.text.trim();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');
    if (_formKey.currentState!.validate()) {
      if (email == savedEmail && password == savedPassword) {
        await prefs.setBool('isLoggedIn', true);

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Login Successful')));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNav()),
        );

      }
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

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    return null;
  }

  void register() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Register()),
    );
  }

  void forgotPassword() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ForgotPassword()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontFamily: 'GalanoGrotesqueBold',
                        fontSize: 45,
                        color: primaryColor,
                      ),
                    ),
                    Text(
                      'back!',
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

                    SizedBox(height: 10),

                    TextFormField(
                      controller: _passwordController,
                      validator: passwordValidator,
                      obscureText: !passwordVisible,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                          icon: Icon(
                            passwordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    GestureDetector(
                      onTap: forgotPassword,
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
                      onPressed: _login,
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
                            style: TextStyle(
                              fontFamily: 'GalanoGrotesqueMedium',
                            ),
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
                          onTap: register,
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
      ),
    );
  }
}
