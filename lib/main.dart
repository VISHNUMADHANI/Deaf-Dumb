import 'package:deafanddumb/Gridmenu_page/LearnGujrati.dart';
import 'package:deafanddumb/Gridmenu_page/LearnMaths.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> LearnScreens = [LearnGujrati(), LearnMaths()];
  final List<String> Learnimagepath = [
    'assets/LearningIcons/Gujrati.png',
    'assets/LearningIcons/Maths.png'
  ];
  final List<String> LearnText = ["GUJARATI", "MATHS"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
              ),
              itemCount: LearnText.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LearnScreens[index]));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                        border: Border.all(color: Colors.black, width: 4)),
                    child: Column(
                      children: [
                        // print(index);
                        Image.asset(
                          Learnimagepath[index],
                          height: 120,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(9),
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 3.0, right: 3.0),
                              child: Text(
                                style: TextStyle(fontWeight: FontWeight.w500),
                                LearnText[index],
                              ),
                            ))
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
