import 'package:flutter/material.dart';
import 'package:promo_vault/const.dart';
import 'package:promo_vault/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading();
  }

  Future<void> _loading() async {
    Future.delayed(Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => isLoggedIn ? Login() : Login(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/MainIcon-bgremove.png'),
              Text(
                'PromoVault',
                style: TextStyle(
                  fontFamily: 'GalanoGrotesqueBold',
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
