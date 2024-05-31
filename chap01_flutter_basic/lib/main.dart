import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 100, // Adjust the position as needed
                          child: VillagerImage(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VillagerImage extends StatefulWidget {
  @override
  _VillagerImageState createState() => _VillagerImageState();
}

class _VillagerImageState extends State<VillagerImage> {
  String imageUrl = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchVillagerImage();
  }

  Future<void> fetchVillagerImage() async {
    const String villagerName =
        'Weber'; // Replace with the desired villager's name

    final response = await http.get(
      Uri.parse('https://api.nookipedia.com/villagers?name=$villagerName'),
      headers: {
        'X-API-KEY':
            '1e12770e-930f-4f94-8bf2-7dd37587e30b', // Replace with your actual API key
        'Accept-Version': '1.7.0',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> villagers = json.decode(response.body);
      if (villagers.isNotEmpty) {
        setState(() {
          imageUrl = villagers[0]['image_url'];
          isLoading = false;
        });
      } else {
        throw Exception('Villager not found');
      }
    } else {
      throw Exception('Failed to load villager image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Center(
            child: SizedBox(
            width: 150,
            height: 150,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ));
  }
}

// Icon(
//   Icons.home,
//   color: Colors.green,
//   size: 100,
// )

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

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Villager Image'),
//           backgroundColor: Colors.purple,
//         ),
//         body: VillagerImage(),
//       ),
//     );
//   }
// }
//
// class VillagerImage extends StatefulWidget {
//   @override
//   _VillagerImageState createState() => _VillagerImageState();
// }
//
// class _VillagerImageState extends State<VillagerImage> {
//   String imageUrl = '';
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchVillagerImage();
//   }
//
//   Future<void> fetchVillagerImage() async {
//     const String villagerName =
//         'Weber'; // Replace with the desired villager's name
//
//     final response = await http.get(
//       Uri.parse('https://api.nookipedia.com/villagers?name=$villagerName'),
//       headers: {
//         'X-API-KEY':
//             '1e12770e-930f-4f94-8bf2-7dd37587e30b', // Replace with your actual API key
//         'Accept-Version': '1.7.0',
//       },
//     );
//
//     if (response.statusCode == 200) {
//       final List<dynamic> villagers = json.decode(response.body);
//       if (villagers.isNotEmpty) {
//         setState(() {
//           imageUrl = villagers[0]['image_url'];
//           isLoading = false;
//         });
//       } else {
//         throw Exception('Villager not found');
//       }
//     } else {
//       throw Exception('Failed to load villager image');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? Center(child: CircularProgressIndicator())
//         : Center(
//             child: Image.network(
//               imageUrl,
//               fit: BoxFit.cover,
//             ),
//           );
//   }
// }
