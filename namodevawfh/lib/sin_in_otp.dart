import 'dart:ui';

import 'package:flutter/material.dart';

class SingINOtp extends StatefulWidget {
  const SingINOtp({super.key});

  @override
  State<SingINOtp> createState() => _SingINOtpState();
}

class _SingINOtpState extends State<SingINOtp> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/Android Large - 123.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 20,
            top: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.2),
                    border: Border.all(color: Colors.white),
                  ),
                  height: screenSize.height * 0.4,
                  width: screenSize.width * 0.9,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'OTP Verification',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Center(
                        child: Text(
                          'Hello XXXXX. OTP Send to your Phone number',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(4, (index) {
                          return SizedBox(
                            width: 60,
                            height: 70,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  counterText: ''),
                              style: const TextStyle(color: Colors.black),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              // Each field accepts one digit
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 45),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.15),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(-1, -3),
                              ),
                            ],
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFFFF6939),
                                Color(0xFFDA3A07),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: 60,
                          width: screenSize.width * 0.6,
                          child: const Center(
                            child: Text(
                              'Sing In',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: screenSize.height * 0.03,
            top: screenSize.height * 0.13,
            child: Image.asset(
              'assets/images/Group 1161 (1).png',
              height: 140,
            ),
          ),
        ],
      ),
    );
  }
}
