import 'package:demo2/CDMM/timeCDMM.dart';
import 'package:demo2/GDN/timeGDN.dart';
import 'package:demo2/MB/timeMB.dart';
import 'package:demo2/MGB/timeMGB.dart';
import 'package:demo2/PRP/timePRP.dart';
import 'package:demo2/SJT/timeSJT.dart';
import 'package:demo2/SMV/timeSMV.dart';
import 'package:demo2/TT/timeTT.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 205, 205, 205),
      ),
      home: const Scaffold(
        body: Center(
          child: MyButtonGrid(),
        ),
      ),
    );
  }
}
class MyButtonGrid extends StatefulWidget {
  const MyButtonGrid({super.key});

  @override
  _MyButtonGridState createState() => _MyButtonGridState();
}

class _MyButtonGridState extends State<MyButtonGrid> {
  List<String> buttonNames = [
    "SJT",
    "TT",
    "SMV",
    "MB",
    "GDN",
    "PRP",
    "CDMM",
    "MGB",
  ];

  List<String> additionalTexts = [
    "Silver jubilee Tower",
    "Technology Tower",
    "Sri M Vishveshwarya \nBlock",
    "Main Building",
    "G.D Naidu Block",
    "Pearl Research Park",
    "Center for Disaster \nMitigation and \nManagement",
    "Mahatma Gandhi Block",
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
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 10), // Changed right: 10 to horizontal: 10
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Text(
              'find it.',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 25.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                color: isSearchBarFocused
                    ? Colors.black
                    : const Color.fromARGB(
                        255, 0, 0, 0), // Changed Color.fromARGB to Colors.grey
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
                    labelText: 'search block',
                    labelStyle: TextStyle(
                      color: isSearchBarFocused
                          ? Colors.black
                          : Colors
                              .grey, // Changed Color.fromARGB to Colors.grey
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: isSearchBarFocused
                          ? Colors.black
                          : Colors
                              .grey, // Changed Color.fromARGB to Colors.grey
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0.0,
              ),
              itemCount: filteredButtons.length,
              itemBuilder: (BuildContext context, int index) {
                final buttonName = filteredButtons[index];
                final additionalText =
                    additionalTexts[buttonNames.indexOf(buttonName)];
                return GestureDetector(
                  onTap: () {
                    print(buttonName);
                    if (buttonName == "SJT") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TimingSJT(),
                        ),
                      );
                    }
                    else if (buttonName == "TT") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TimingTT(),
                        ),
                      );
                    }
                    else if (buttonName == "SMV") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TimingSMV(),
                        ),
                      );
                    }
                    else if (buttonName == "MB") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TimingMB(),
                        ),
                      );
                    }
                    else if (buttonName == "GDN") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TimingGDN(),
                        ),
                      );
                    }
                    else if (buttonName == "PRP") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TimingPRP(),
                        ),
                      );
                    }
                    else if (buttonName == "CDMM") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TimingCDMM(),
                        ),
                      );
                    }
                    else if (buttonName == "MGB") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TimingMGB(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 140.0,
                    height: 140.0,
                    alignment: Alignment.center,
                    child: Container(
                      width: 140.0,
                      height: 140.0,
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
                          const SizedBox(height: 8.0),
                          Text(
                            additionalText,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 10.0,
                              fontStyle: FontStyle.normal,
                              color: Color.fromARGB(255, 0, 0, 0),
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
