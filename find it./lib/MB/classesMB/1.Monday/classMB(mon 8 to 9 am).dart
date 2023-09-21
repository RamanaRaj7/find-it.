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
        body: classMBmon8to9am(),
      ),
    );
  }
}

class classMBmon8to9am extends StatelessWidget {
  const classMBmon8to9am({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> buttonNames = [
      "G-24",
      "G-12",
      "G-6",
      "103",
      "206",
      "308",
      "411",
      "512",
    ];

    return Scaffold(
      body: Column(
        children: [
          // Add your text widget here
          const Padding(
            padding: EdgeInsets.only(top: 80.0),
            child: Text(
              "Monday MB (8 to 9 am)", // Replace with your desired text
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: buttonNames.length, // Number of containers
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
              ),
              itemBuilder: (context, index) {
                return Container(
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
                          buttonNames[index], // Use buttonNames[index] here
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                      ],
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
