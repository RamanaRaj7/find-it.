import 'package:demo2/SMV/classesSMV/1.Monday/classSMV(mon%208%20to%209%20am).dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 205, 205, 205),
      ),
      home: const Scaffold(
        body: Center(
          child: TimingSMV(),
        ),
      ),
    );
  }
}

class TimingSMV extends StatefulWidget {
  const TimingSMV({Key? key});

  @override
  _TimingSMVState createState() => _TimingSMVState();
}

class _TimingSMVState extends State<TimingSMV> {
  List<String> buttonNames = [
    "8 to 9 am",
    "9 to 10 am",
    "10 to 11 am",
    "11 to 12 pm",
    "12 to 1 pm",
    "1 to 2 pm",
    "2 to 3 pm",
    "3 to 4 pm",
    "4 to 5 pm",
    "5 to 6 pm",
    "6 to 7 pm",
  ];

  List<String> filteredButtons = [];

  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  bool isSearchBarFocused = false;

  @override
  void initState() {
    super.initState();
    filteredButtons.addAll(buttonNames);

    searchFocusNode.addListener(() {
      setState(() {
        isSearchBarFocused = searchFocusNode.hasFocus;
      });
    });
  }

  void filterButtons(String query) {
    setState(() {
      filteredButtons = buttonNames.where((name) {
        return name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs for Monday to Friday
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 90.0),
              child: Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    color: Colors.black,
                    width: 2.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0), // Adjust the top padding as needed
                  child: TabBar(
                    tabs: const [
                      Tab(text: 'Mon'),
                      Tab(text: 'Tue'),
                      Tab(text: 'Wed'),
                      Tab(text: 'Thu'),
                      Tab(text: 'Fri'),
                    ],
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    labelColor: Colors.white, // Color of the selected tab text
                    unselectedLabelColor: Color.fromARGB(255, 0, 0, 0),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.black,
                    ),
                    indicatorPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  buildTabContent(),
                  buildTabContent(),
                  buildTabContent(),
                  buildTabContent(),
                  buildTabContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          // const Padding(
          //   padding: EdgeInsets.only(top: 80.0),
          //   child: Text(
          //     'timings.',
          //     style: TextStyle(
          //       fontSize: 40.0,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          const SizedBox(height: 20.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                color: isSearchBarFocused
                    ? const Color.fromARGB(255, 0, 0, 0)
                    : const Color.fromARGB(255, 0, 0, 0),
                width: 2.5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: 60.0,
                width: 300,
                child: TextField(
                  controller: searchController,
                  onChanged: filterButtons,
                  focusNode: searchFocusNode,
                  decoration: InputDecoration(
                    labelText: 'search timing',
                    labelStyle: TextStyle(
                      color: isSearchBarFocused ? Colors.black : Colors.grey,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: isSearchBarFocused ? Colors.black : Colors.grey,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredButtons.length,
              itemBuilder: (BuildContext context, int index) {
                final buttonName = filteredButtons[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      print(buttonName);
                      if (buttonName == "8 to 9 am" &&
                          DefaultTabController.of(context).index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const classSMVmon8to9am(),
                          ),
                        );
                        // Handle the navigation here if needed
                      }
                    },
                    child: Container(
                      width: 120.0,
                      height: 80.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                        color: const Color.fromARGB(255, 205, 205, 205),
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 255, 255, 255),
                            Color.fromARGB(255, 255, 255, 255),
                          ],
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 204, 204, 204),
                            offset: Offset(-14, -14),
                            blurRadius: 0,
                            spreadRadius: 0.0,
                          ),
                          BoxShadow(
                            color: Color.fromARGB(255, 0, 0, 0),
                            offset: Offset(14, 14),
                            blurRadius: 0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            buttonName,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
