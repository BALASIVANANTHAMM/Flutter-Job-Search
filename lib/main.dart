import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job Search Platform',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "role": "Software Developer", "experience": 1,"company":"Xy"},
    {"id": 2, "role": "Application Developer", "experience": 2,"company":"XyZ"},
    {"id": 3, "role": "Application Tester", "experience": 0,"company":"Ab"},
    {"id": 4, "role": "Data Analyst", "experience": 3,"company":"Av"},
    {"id": 5, "role": "System Admin", "experience": 0,"company":"Dr"},
    {"id": 6, "role": "Java Developer", "experience": 2,"company":"Ty"},
    {"id": 7, "role": "Backend Developer", "experience": 1,"company":"Yr"},
    {"id": 8, "role": "Sql Developer", "experience": 5,"company":"UY"},
    {"id": 9, "role": "FrontEnd Developer", "experience": 1,"company":"XYZ"},
    {"id": 10, "role": "Data Engineer", "experience": 0,"company":"Xy"},
    {"id": 11, "role": "FullStack Developer", "experience": 2,"company":"Va"},
    {"id": 12, "role": "MernStack Developer", "experience": 6,"company":"Kas"},
    {"id": 13, "role": "Data Scientist", "experience": 4,"company":"Ts"},
    {"id": 14, "role": "RPA Developer", "experience": 2,"company":"Wo"},
    {"id": 15, "role": "Testing Engineer", "experience": 3,"company":"Hl"}
  ];

  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isNotEmpty) {
      results = _allUsers
          .where((user) =>
          user["role"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  hintText: 'Search Here',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundUsers[index]["id"]),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Text(
                      _foundUsers[index]["id"].toString(),
                      style: const TextStyle(fontSize: 24),
                    ),
                    title: Text('${_foundUsers[index]['role']}   Posted by  ${_foundUsers[index]['company']}'),
                    subtitle: Text(
                        '${_foundUsers[index]["experience"].toString()} Years of Experience'),
                    trailing:
                    IconButton(
                      onPressed: (){
                        setState(() {
                          print("Apply Successfully  ${_foundUsers[index]['role']}   Posted by  ${_foundUsers[index]['company']}");
                        });
                      },
                      icon: Icon(Icons.touch_app_outlined),
                    ),
                  ),
                ),
              )
                  : const Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}