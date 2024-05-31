// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HttpApp(),
//     );
//   }
// }
//
// class HttpApp extends StatefulWidget {
//   const HttpApp({super.key});
//
//   @override
//   State<HttpApp> createState() => _HttpAppState();
// }
//
// class _HttpAppState extends State<HttpApp> {
//   String result = ""; //검색 결과를 저장할 변수
//   List? data; //검색 결과 데이터를 저장할 리스트-> null 가능
//   TextEditingController? _editingController;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     data = new List.empty(growable: true);
//     _editingController = TextEditingController();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: TextField(
//         controller: _editingController,
//         style: TextStyle(color: Colors.black),
//         keyboardType: TextInputType.text,
//         decoration: InputDecoration(hintText: '검색어를 입력해주세요'),
//       )),
//       body: Container(
//         child: Center(
//             child: data!.length == 0
//                 ? Text(
//                     '데이터가 없습니다.',
//                     style: TextStyle(fontSize: 10),
//                     textAlign: TextAlign.center,
//                   )
//                 : ListView.builder(
//                     itemBuilder: (context, index) {
//                       return Card(
//                         child: Container(
//                           child: Column(
//                             children: <Widget>[
//                               Text(data![index]['title'].toString()),
//                               Text(data![index]['authors'].toString()),
//                               Text(data![index]['sale_price'].toString()),
//                               Text(data![index]['status'].toString()),
//                               Image.network(
//                                 data![index]['thumbnail'],
//                                 height: 100,
//                                 width: 100,
//                                 fit: BoxFit.contain,
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                     itemCount: data!.length,
//                   )),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           getJSONData();
//           data!.clear();
//         },
//         child: Icon(Icons.file_download),
//       ),
//     );
//   }
//
//   Future<String> getJSONData() async {
//     var url =
//         'https://dapi.kakao.com/v3/search/book?target=title&query=${_editingController!.value.text}';
//     var response = await http.get(Uri.parse(url),
//         headers: {"Authorization": "KakaoAK f6976b07f89ba2558e55e1c8c246a4be"});
//     print(response.body);
//
//     setState(() {
//       var dataConvertedToJSON = json.decode(response.body);
//       List result = dataConvertedToJSON['documents'];
//       data!.addAll(result); //기존 데이터에 새로운 결과 추가
//     });
//     return response.body;
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Nookipedia Villagers'),
          backgroundColor: Colors.purple,
        ),
        body: VillagersList(),
      ),
    );
  }
}

class VillagersList extends StatefulWidget {
  @override
  _VillagersListState createState() => _VillagersListState();
}

class _VillagersListState extends State<VillagersList> {
  List<dynamic> villagers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchVillagers();
  }

  Future<void> fetchVillagers() async {
    final response = await http.get(
      Uri.parse('https://api.nookipedia.com/villagers'),
      headers: {
        'X-API-KEY':
            '1e12770e-930f-4f94-8bf2-7dd37587e30b', // Replace with your actual API key
        'Accept-Version': '1.7.0',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        villagers = json.decode(response.body);
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load villagers');
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: villagers.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          VillagerDetailPage(villager: villagers[index]),
                    ),
                  );
                },
                leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.network(
                    villagers[index]['image_url'],
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(villagers[index]['name']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(villagers[index]['species']),
                    Text(villagers[index]['personality']),
                  ],
                ),
              );
            },
          );
  }
}

class VillagerDetailPage extends StatelessWidget {
  final Map<String, dynamic> villager;

  const VillagerDetailPage({Key? key, required this.villager})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(villager['name']),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Species: ${villager['species']}'),
            Text('Personality: ${villager['personality']}'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
