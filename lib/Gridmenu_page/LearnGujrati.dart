import 'package:deafanddumb/periticulareimage_pages/Guj/GujVowelsImage.dart';
import 'package:flutter/material.dart';

class LearnGujrati extends StatefulWidget {
  @override
  _LearnGujratiState createState() => _LearnGujratiState();
}

class _LearnGujratiState extends State<LearnGujrati> {
  final List<String> vowels = <String>[
    "અ",
    "આ",
    "ઇ",
    "ઈ",
    "ઉ",
    "ઊ",
    "એ",
    "ઐ",
    "ઓ",
    "ઔ",
    "અં",
    "અઃ"
  ];
  final List<String> consonants = <String>[
    'ક',
    'ખ',
    'ગ',
    'ઘ',
    'ચ',
    'છ',
    'જ',
    'ઝ',
    'ટ',
    'ઠ',
    'ડ',
    'ઢ',
    'ત',
    'થ',
    'દ',
    'ધ',
    'પ',
    'ફ',
    'બ',
    'ભ',
    'મ',
    'ન',
    'ય',
    'ર',
    'લ',
    'વ',
    'શ',
    'ષ',
    'સ',
    'હ',
    'ળ',
    'ણ',
    'ક્ષ',
    'જ્ઞ'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn Gujarati"), // Changed title to match the content
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black, width: 5),
                ),
                child: Center(
                  child: Text(
                    "સ્વર",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 300, // Adjust this height as needed
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                physics:
                    NeverScrollableScrollPhysics(), // Disable GridView scrolling
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: vowels.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Gujvowelsimage(vowelsGridindex: index),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          vowels[index],
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black, width: 5),
                ),
                child: Center(
                  child: Text(
                    "વ્યંજન",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 500, // Adjust this height as needed
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                physics:
                    NeverScrollableScrollPhysics(), // Disable GridView scrolling
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: consonants.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Gujvowelsimage(vowelsGridindex: index),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          consonants[index],
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
