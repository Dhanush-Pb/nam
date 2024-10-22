import 'package:flutter/material.dart';
import 'package:namodevawfh/home/sahithya%20_details.dart';

class SahithyaPage extends StatefulWidget {
  const SahithyaPage({super.key});

  @override
  State<SahithyaPage> createState() => _SahithyaPageState();
}

class _SahithyaPageState extends State<SahithyaPage> {
  final TextEditingController _searchController = TextEditingController();

  // Static JSON-like structure for image descriptions
  final List<Map<dynamic, dynamic>> imageDetails = [
    {
      'imagePath': 'assets/sahithya/Frame 89.png',
      'description': 'Education',
      'list': List.generate(10, (index) {
        return {
          'heading': 'Book of Knowledge $index',
          'subheading': 'Learning Path $index',
          'bigDescription':
              'Every challenge we face is an opportunity to grow, as the process of learning—whether through success or failure—enriches our understanding, strengthens our resilience, and empowers us to achieve greater things in life.',
          'godName': 'Saraswati',
        };
      }),
    },
    {
      'imagePath': 'assets/sahithya/Frame 90.png',
      'description': 'Job',
      'list': List.generate(10, (index) {
        return {
          'heading': 'Work Goal $index',
          'subheading': 'Career Step $index',
          'bigDescription':
              'Every job, no matter how small or seemingly insignificant, plays a crucial role in building the foundation for a successful and fulfilling career by providing valuable skills, experiences, and opportunities for growth.',
          'godName': 'Vishwakarma',
        };
      }),
    },
    {
      'imagePath': 'assets/sahithya/Frame 91.png',
      'description': 'Marriage',
      'list': List.generate(10, (index) {
        return {
          'heading': 'Union of Love $index',
          'subheading': 'Bonding of Hearts $index',
          'bigDescription':
              'Marriage is a sacred union that strengthens the bonds of love, trust, and companionship between two individuals. It is not just a commitment, but a lifelong journey filled with joy, challenges, and shared memories. Through marriage, two people come together to support one another, grow together, and create a foundation of love that transcends time. It is a partnership rooted in respect and mutual understanding, fostering a deep connection that brings peace and fulfillment.',
          'godName': 'Parvati',
        };
      }),
    },
    {
      'imagePath': 'assets/sahithya/Frame 92.png',
      'description': 'Family',
      'list': List.generate(10, (index) {
        return {
          'heading': 'Family Support $index',
          'subheading': 'Strong Ties $index',
          'bigDescription':
              'Family gives strength and support through all. Every challenge we face is an opportunity to grow, as the process of learning—whether through success or failure—enriches our understanding, strengthens our resilience, and empowers us to achieve greater things in life',
          'godName': 'Shiva',
        };
      }),
    },
    {
      'imagePath': 'assets/sahithya/Frame 93.png',
      'description': 'Progeny',
      'list': List.generate(10, (index) {
        return {
          'heading': 'Children\'s Future $index',
          'subheading': 'Parental Guidance $index',
          'bigDescription':
              'Children are the future and need proper guidance.Marriage is a sacred union that strengthens the bonds of love, trust, and companionship between two individuals. It is not just a commitment, but a lifelong journey filled with joy, challenges, and shared memories. Through marriage, two people come together to support one another, grow together, and create a foundation of love that transcends time. It is a partnership rooted in respect and mutual understanding, fostering a deep connection that brings peace and fulfillment.',
          'godName': 'Krishna',
        };
      }),
    },
    {
      'imagePath': 'assets/sahithya/Frame 94.png',
      'description': 'Wealth',
      'list': List.generate(10, (index) {
        return {
          'heading': 'Riches of Life $index',
          'subheading': 'Fortune Path $index',
          'bigDescription':
              'Wealth brings comfort and stability.Marriage is a sacred union that strengthens the bonds of love, trust, and companionship between two individuals. It is not just a commitment, but a lifelong journey filled with joy, challenges, and shared memories. Through marriage, two people come together to support one another, grow together, and create a foundation of love that transcends time. It is a partnership rooted in respect and mutual understanding, fostering a deep connection that brings peace and fulfillment.',
          'godName': 'Lakshmi',
        };
      }),
    },
    {
      'imagePath': 'assets/sahithya/Frame 95.png',
      'description': 'Acquittal',
      'list': List.generate(10, (index) {
        return {
          'heading': 'Freedom from Bonds $index',
          'subheading': 'Release Path $index',
          'bigDescription':
              'Acquittal frees you from life’s burdens.Marriage is a sacred union that strengthens the bonds of love, trust, and companionship between two individuals. It is not just a commitment, but a lifelong journey filled with joy, challenges, and shared memories. Through marriage, two people come together to support one another, grow together, and create a foundation of love that transcends time. It is a partnership rooted in respect and mutual understanding, fostering a deep connection that brings peace and fulfillment.',
          'godName': 'Vishnu',
        };
      }),
    },
    {
      'imagePath': 'assets/sahithya/Frame 96.png',
      'description': 'Business',
      'list': List.generate(10, (index) {
        return {
          'heading': 'Trade Growth $index',
          'subheading': 'Business Expansion $index',
          'bigDescription':
              'Business success requires hard work and strategy.Marriage is a sacred union that strengthens the bonds of love, trust, and companionship between two individuals. It is not just a commitment, but a lifelong journey filled with joy, challenges, and shared memories. Through marriage, two people come together to support one another, grow together, and create a foundation of love that transcends time. It is a partnership rooted in respect and mutual understanding, fostering a deep connection that brings peace and fulfillment.',
          'godName': 'Kubera',
        };
      }),
    },
    {
      'imagePath': 'assets/sahithya/Frame 97.png',
      'description': 'Spiritual',
      'list': List.generate(10, (index) {
        return {
          'heading': 'Path of Enlightenment $index',
          'subheading': 'Spiritual Growth $index',
          'bigDescription':
              'Spirituality brings peace and clarity in life.Marriage is a sacred union that strengthens the bonds of love, trust, and companionship between two individuals. It is not just a commitment, but a lifelong journey filled with joy, challenges, and shared memories. Through marriage, two people come together to support one another, grow together, and create a foundation of love that transcends time. It is a partnership rooted in respect and mutual understanding, fostering a deep connection that brings peace and fulfillment.',
          'godName': 'Shiva',
        };
      }),
    },
    {
      'imagePath': 'assets/sahithya/Frame 98.png',
      'description': 'Health',
      'list': List.generate(10, (index) {
        return {
          'heading': 'Healthy Living $index',
          'subheading': 'Wellness Plan $index',
          'bigDescription':
              'Good health is the foundation of a happy life.Marriage is a sacred union that strengthens the bonds of love, trust, and companionship between two individuals. It is not just a commitment, but a lifelong journey filled with joy, challenges, and shared memories. Through marriage, two people come together to support one another, grow together, and create a foundation of love that transcends time. It is a partnership rooted in respect and mutual understanding, fostering a deep connection that brings peace and fulfillment.',
          'godName': 'Dhanvantari',
        };
      }),
    },
    {
      'imagePath': 'assets/sahithya/Frame 100.png',
      'description': 'Sins',
      'list': List.generate(10, (index) {
        return {
          'heading': 'Repentance $index',
          'subheading': 'Seeking Forgiveness $index',
          'bigDescription':
              'Repentance helps cleanse your soul from sins.Marriage is a sacred union that strengthens the bonds of love, trust, and companionship between two individuals. It is not just a commitment, but a lifelong journey filled with joy, challenges, and shared memories. Through marriage, two people come together to support one another, grow together, and create a foundation of love that transcends time. It is a partnership rooted in respect and mutual understanding, fostering a deep connection that brings peace and fulfillment.',
          'godName': 'Yama',
        };
      }),
    },
    {
      'imagePath': 'assets/sahithya/Frame 101.png',
      'description': 'Curse',
      'list': List.generate(10, (index) {
        return {
          'heading': 'Breaking Curses $index',
          'subheading': 'Path of Redemption $index',
          'bigDescription':
              'Curses can be broken with effort and virtue.Marriage is a sacred union that strengthens the bonds of love, trust, and companionship between two individuals. It is not just a commitment, but a lifelong journey filled with joy, challenges, and shared memories. Through marriage, two people come together to support one another, grow together, and create a foundation of love that transcends time. It is a partnership rooted in respect and mutual understanding, fostering a deep connection that brings peace and fulfillment.',
          'godName': 'Shani',
        };
      }),
    },
    {
      'imagePath': 'assets/sahithya/Frame 102.png',
      'description': 'Dhosh',
      'list': List.generate(10, (index) {
        return {
          'heading': 'Karmic Balance $index',
          'subheading': 'Rectifying Dhosh $index',
          'bigDescription':
              'Dhosh can be mitigated by performing good deeds.Marriage is a sacred union that strengthens the bonds of love, trust, and companionship between two individuals. It is not just a commitment, but a lifelong journey filled with joy, challenges, and shared memories. Through marriage, two people come together to support one another, grow together, and create a foundation of love that transcends time. It is a partnership rooted in respect and mutual understanding, fostering a deep connection that brings peace and fulfillment.',
          'godName': 'Rahuketu',
        };
      }),
    },
    {
      'imagePath': 'assets/sahithya/Frame 103.png',
      'description': 'Debt',
      'list': List.generate(10, (index) {
        return {
          'heading': 'Debt Relief $index',
          'subheading': 'Paying Back $index',
          'bigDescription':
              'Debts should be paid off to lead a peaceful life.Marriage is a sacred union that strengthens the bonds of love, trust, and companionship between two individuals. It is not just a commitment, but a lifelong journey filled with joy, challenges, and shared memories. Through marriage, two people come together to support one another, grow together, and create a foundation of love that transcends time. It is a partnership rooted in respect and mutual understanding, fostering a deep connection that brings peace and fulfillment.',
          'godName': 'Kubera',
        };
      }),
    },
    {
      'imagePath': 'assets/sahithya/Frame 104.png',
      'description': 'Others',
      'list': List.generate(10, (index) {
        return {
          'heading': 'Miscellaneous $index',
          'subheading': 'General Matters $index',
          'bigDescription':
              'Other life aspects can have unexpected challenges.Marriage is a sacred union that strengthens the bonds of love, trust, and companionship between two individuals. It is not just a commitment, but a lifelong journey filled with joy, challenges, and shared memories. Through marriage, two people come together to support one another, grow together, and create a foundation of love that transcends time. It is a partnership rooted in respect and mutual understanding, fostering a deep connection that brings peace and fulfillment.',
          'godName': 'Ganesha',
        };
      }),
    },
  ];

  @override
  void dispose() {
    _searchController.dispose(); // Dispose the controller to free up resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Filtering based on search input
    final searchQuery = _searchController.text.toLowerCase();
    final filteredImages = imageDetails.where((imageDetail) {
      return imageDetail['description']!.toLowerCase().contains(searchQuery);
    }).toList();

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 190,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/Union.png',
                    width: screenSize.width,
                    height: screenSize.height,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                  Positioned(
                    top: screenSize.height * 0.13,
                    left: 16,
                    right: 16,
                    child: SizedBox(
                      width: screenSize.width * 0.9,
                      child: TextField(
                        controller: _searchController,
                        onChanged: (value) {
                          setState(() {}); // Update state on text change
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white.withOpacity(0.9),
                          filled: true,
                          hintText: "Search...",
                          hintStyle: const TextStyle(color: Colors.grey),
                          suffixIcon: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(198, 247, 199, 165),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.only(left: 5),
                            child: const Icon(
                              Icons.search,
                              color: Colors.redAccent,
                              size: 30,
                            ),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns in the grid
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 8, // Space between columns
                  mainAxisSpacing: 8, // Space between rows
                ),
                itemCount: filteredImages.length,
                itemBuilder: (context, index) {
                  final imageDetail = filteredImages[index];
                  return Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SahithyaDetails(
                                    data: imageDetails[index]['list'],
                                  )));
                        },
                        child: Card(
                          elevation: 4,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              imageDetail['imagePath']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // Positioned(
                      //   bottom: 0,
                      //   left: 0,
                      //   right: 0,
                      //   child: Container(
                      //     color: Colors.black54,
                      //     padding: const EdgeInsets.all(8),
                      //     child: Text(
                      //       imageDetail['description']!,
                      //       style: const TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //       textAlign: TextAlign.center,
                      //     ),
                      //   ),
                      // ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
