import 'package:flutter/material.dart';
import 'package:namodevawfh/home/song_page.dart';

import 'package:namodevawfh/sing_up_.dart';
import 'package:namodevawfh/sing_inpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/images/Android Large - 123.png',
            fit: BoxFit.cover,
          )),
          Positioned(
              left: screenSize.height * 0.1,
              right: screenSize.height * 0.1,
              top: screenSize.height * 0.2,
              child: Image.asset(
                'assets/images/Group 1163.png',
              )),
          Positioned(
              left: screenSize.width * 0.1,
              top: screenSize.height * 0.6,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const SingInpage()));
                },
                onLongPress: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const SongPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(-1, -3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  height: 50,
                  width: screenSize.width * 0.8,
                  child: const Center(
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 255, 106, 0)),
                    ),
                  ),
                ),
              )),
          Positioned(
              left: screenSize.width * 0.1,
              top: screenSize.height * 0.7,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const SingUPpage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(-1, -3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  height: 50,
                  width: screenSize.width * 0.8,
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 255, 106, 0)),
                    ),
                  ),
                ),
              )),
          Positioned(
              left: 190,
              top: screenSize.height * 0.8,
              child: const Text(
                'OR',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              )),
          Positioned(
              left: screenSize.width * 0.1,
              bottom: screenSize.height * 0.08,
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(-1, -3),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                height: 50,
                width: screenSize.width * 0.8,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/google.png',
                        width: 30,
                      ),
                      const Text(
                        'Continue with google',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 255, 106, 0)),
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
