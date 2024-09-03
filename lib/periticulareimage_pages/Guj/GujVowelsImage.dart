import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Gujvowelsimage extends StatefulWidget {
  const Gujvowelsimage({Key? key, required this.vowelsGridindex})
      : super(key: key);
  final int vowelsGridindex;
  @override
  _GujvowelsimageState createState() => _GujvowelsimageState();
  // TODO: implement createState
  // throw UnimplementedError();
}

class _GujvowelsimageState extends State<Gujvowelsimage> {
  final List<String> swar = <String>[
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
  // late String imageSt;

  late int index = widget.vowelsGridindex + 1;
  void decrementimage() async {
    setState(() {
      if (index == 1) {
      } else {
        index--;
        fetchimage();
      }
    });
  }

  void incrementimage() async {
    setState(() {
      if (index == 12) {
      } else {
        index++;
        // print(index);
        fetchimage();
      }
      // print(index);
    });
  }

  Future<String> fetchimage() async {
    // index = widget.vowelsGridindex + 1;
    // print(index
    final url = 'http://192.168.83.118:3000/vowel/$index';

    // final url = ' https://10.0.2.2:3000/vowel/$index';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.body.trim();
        // print("Data : $imageSt");
      } else {
        print("Failed to load image");
        return '';
      }
    } catch (e) {
      print("Error : $e");
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign"),
      ),
      body: FutureBuilder<String>(
        future: fetchimage(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator while waiting for data
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Handle errors
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Handle cases where there is no URL
            return Text('No image URL');
          } else {
            // Display the image using Image.network
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.purple,
                    ),
                    height: 370,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: decrementimage,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(25),
                                        topRight: Radius.circular(25))),
                                child: Image.asset(
                                  'assets/LearningIcons/lefticon.png',
                                  height: 70,
                                ))),
                        SizedBox(
                          width: 8,
                        ),
                        Image.network(
                          snapshot.data!,
                          // height: 300,
                          width: 220,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                            onTap: incrementimage,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  border:
                                      Border.all(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25))),
                              child: Image.asset(
                                'assets/LearningIcons/righticon.png',
                                height: 70,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.purple,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: decrementimage,
                              child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(25),
                                          topRight: Radius.circular(25))),
                                  child: Image.asset(
                                    'assets/LearningIcons/lefticon.png',
                                    height: 70,
                                  ))),
                          Text(
                            swar[index - 1],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 45),
                          ),
                          InkWell(
                              onTap: incrementimage,
                              child: Container(
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        bottomRight: Radius.circular(25))),
                                child: Image.asset(
                                  'assets/LearningIcons/righticon.png',
                                  height: 70,
                                ),
                              )),
                          SizedBox(
                            height: 100,
                          )
                        ]),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
