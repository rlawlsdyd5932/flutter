import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AppBar'),
          backgroundColor: Color(0xFF00A059),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          width: 341,
                          height: 573,
                          color: Color(0xFFFFB800),
                          // child: Text('컨테이너'),
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(35),
                          padding: EdgeInsets.only(bottom: 20),
                        ),
                        Positioned(
                          top: 50,
                          child: Text(
                            '아잠만',
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    // Icon(
                    //   Icons.home,
                    //   color: Colors.green,
                    //   size: 100,
                    // )
                  ],
                ),
                /* profilePhoto */
                // Image.asset('assets/images/cat.jpg'),
                // Image.network(
                //     'https://gratisography.com/wp-content/uploads/2023/10/gratisography-cool-cat-800x525.jpg'),
                // Image.network(
                //     'https://gratisography.com/wp-content/uploads/2023/05/gratisography-colorful-cat-free-stock-photo-800x525.jpg'),
                // TextField(
                //   decoration: InputDecoration(labelText: 'input'),
                //   //입력폼(text)에 값이 변경될 경우 작동한다.
                //   onChanged: (text) {
                //     // print(text);
                //   },
                //   //엔터를 눌렀을 경우 작동한다.
                //   onSubmitted: (text) {
                //     print("enter 누름: $text");
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
