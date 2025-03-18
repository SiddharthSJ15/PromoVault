import 'package:flutter/material.dart';
import 'package:promo_vault/const.dart';
import 'package:promo_vault/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    confirmPasswordVisible = false;
    passwordVisible = false;
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> _register() async {
    if (_formKey.currentState!.validate() &&
        _confirmPasswordController.text == _passwordController.text) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', _emailController.text.trim());
      await prefs.setString('password', _passwordController.text.trim());
      if (mounted) {
        await prefs.setBool('isLoggedIn', true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
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
    // Regex for password: Minimum 8 chars, at least 1 letter, 1 number, 1 special character
    // final RegExp passwordRegex = RegExp(
    //   r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
    // );

    // if (!passwordRegex.hasMatch(value)) {
    //   return 'Password must be at least 8 characters, include a \nnumber, and a special character';
    // }
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm password cannot be empty';
    }
    return null;
  }

  void login() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
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
                      obscureText: !passwordVisible,
                      controller: _passwordController,
                      validator: passwordValidator,
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

                    TextFormField(
                      obscureText: !confirmPasswordVisible,
                      controller: _confirmPasswordController,
                      validator: confirmPasswordValidator,
                      decoration: InputDecoration(
                        hintText: 'Re-enter password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              confirmPasswordVisible = !confirmPasswordVisible;
                            });
                          },
                          icon: Icon(
                            confirmPasswordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
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
                      onPressed: _register,
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

                    SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(fontFamily: 'GalanoGrotesqueMedium'),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: login,
                          child: Text(
                            "Sign In",
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
