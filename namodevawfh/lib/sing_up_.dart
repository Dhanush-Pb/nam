import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:namodevawfh/sing_inpage.dart';
import 'package:namodevawfh/sing_up_otp.dart';

class SingUPpage extends StatefulWidget {
  const SingUPpage({super.key});

  @override
  State<SingUPpage> createState() => _SingUPpageState();
}

class _SingUPpageState extends State<SingUPpage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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
            top: screenSize.height * 0.28,
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
                  height:
                      screenSize.height * 0.5, // Increased height for fields
                  width: screenSize.width * 0.9,
                  padding: const EdgeInsets.all(16.0), // Added padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Welcome',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Center(
                        child: Text(
                          'Create Your account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Enter your Name',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Name..',
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Enter Phone number',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          hintText: 'Phone Number...',
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const SingInpage()));
                            },
                            child: const Text(' Sing in',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.white, // White line below the text
                        thickness: .0,
                        height: 5,
                        indent: 210, // Optional, indenting the line
                        endIndent: 40, // Optional, ending the line early
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SingupOtp()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(
                                      0.15), // Shadow color with transparency
                                  spreadRadius: 2, // Spread of the shadow
                                  blurRadius: 5, // Softness of the shadow
                                  offset: const Offset(
                                      -1, -3), // Shadow position (x, y)
                                ),
                              ],
                              gradient: const LinearGradient(
                                begin: Alignment
                                    .centerLeft, // Start of the gradient (left)
                                end: Alignment
                                    .centerRight, // End of the gradient (right)
                                colors: [
                                  Color(0xFFFF6939), // #FF6939
                                  Color(0xFFDA3A07), // #DA3A07
                                ],
                              ),
                              borderRadius: BorderRadius.circular(
                                  30), // Optional: Add rounded corners if needed
                            ),
                            height: screenSize.height * 0.07,
                            width: screenSize.width * 0.6,
                            child: const Center(
                              child: Text(
                                'Get OTP',
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
