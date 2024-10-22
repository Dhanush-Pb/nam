import 'package:flutter/material.dart';

class sahithyafulldetails extends StatefulWidget {
  final dynamic godName;
  final String bigdecscrption;
  const sahithyafulldetails(
      {super.key, required this.godName, required this.bigdecscrption});

  @override
  State<sahithyafulldetails> createState() => _sahithyafulldetailsState();
}

class _sahithyafulldetailsState extends State<sahithyafulldetails> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(90), // Custom height for the AppBar
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: Stack(
            children: [
              Image.asset(
                'assets/images/Union.png',
                width: screenSize.width,
                height: 190, // Same height as PreferredSize
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
              // Optionally, you can add more widgets like title or icons on top of the image
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add other body content here
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://media.istockphoto.com/id/1359149467/photo/shot-of-a-handsome-young-man-standing-alone-and-stretching-during-his-outdoor-workout.jpg?s=612x612&w=0&k=20&c=bCwqY95KICwmFZKRgbc9yd9O-0Ra1oHrhv6vYe6Weh8=',
                  width: screenSize.width * 0.9,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 20, left: 15),
            child: Text(
              'Auspicious Mantra of God ',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 189, 8, 8)),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: Container(
              height: 60,
              width: screenSize.width * 0.95,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(width: 1, color: Colors.orange)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Image.asset(
                      'assets/sahithya/Frame 104.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.godName,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 255, 102, 0)),
                      ),
                      Text('Read sree ${widget.godName} mantra',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 231, 127, 57)
                                  .withOpacity(0.5),
                              fontWeight: FontWeight.w600)),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Description :',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 189, 8, 8)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 5),
                    child: Text(
                      widget.bigdecscrption,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'How To Do:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 189, 8, 8)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 5, bottom: 10),
                    child: Text(
                      widget.bigdecscrption,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
