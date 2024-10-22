import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:namodevawfh/home/sahithya_page.dart';

class SingupOtp extends StatefulWidget {
  const SingupOtp({super.key});

  @override
  State<SingupOtp> createState() => _SingupOtpState();
}

class _SingupOtpState extends State<SingupOtp> {
  final TextEditingController otpController = TextEditingController();

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Dont Recive a OTP ?',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              // Handle sign in navigation
                            },
                            child: const Text(
                              ' Resend',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 0.5,
                        height: 5,
                        indent: 200,
                        endIndent: 60,
                      ),
                      const SizedBox(height: 15),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SahithyaPage()));
                          },
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
                                'Sing Up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
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
