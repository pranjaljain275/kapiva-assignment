import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  List<dynamic> dataList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    final url = 'https://yif-library-be.onrender.com/book';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        dataList = data;
        isLoading = false;
      });
    } else {
      // Handle error here
      setState(() {
        dataList = [];
        isLoading = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to fetch data'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> refreshData() async {
    await fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Node App'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: refreshData,
              child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = dataList[index];
                  return ListTile(
                    title: Text(item['bookName']),
                    subtitle: Text(item['authorName']),
                  );
                },
              ),
            ),
    );
  }
}
