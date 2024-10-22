import 'package:flutter/material.dart';
import 'package:namodevawfh/home/sahithya_full_details.dart';

class SahithyaDetails extends StatefulWidget {
  final List<dynamic> data;

  const SahithyaDetails({super.key, required this.data});

  @override
  State<SahithyaDetails> createState() => _SahithyaDetailsState();
}

class _SahithyaDetailsState extends State<SahithyaDetails> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose(); // Dispose the controller to free up resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final searchQuery = _searchController.text.toLowerCase();

    // Filter the data based on the search query
    List<dynamic> filteredData = widget.data.where((item) {
      return item['heading'].toLowerCase().contains(searchQuery);
    }).toList();

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 190,
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
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
              child: ListView.builder(
                itemCount: filteredData.length,
                itemBuilder: (context, index) {
                  final item = filteredData[index];
                  return Card(
                    child: ListTile(
                      title: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['heading'],
                                style: const TextStyle(
                                    color: Color(0xFF9F1010),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(item['subheading']),
                            ],
                          ),
                        ],
                      ),
                      subtitle: const Row(
                        children: [],
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color.fromARGB(255, 255, 85, 0),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            // ignore: prefer_const_constructors
                            builder: (context) => sahithyafulldetails(
                                  godName: item['godName'],
                                  bigdecscrption: item['bigDescription'],
                                )));
                      },
                    ),
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
