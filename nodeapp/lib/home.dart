import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  // The dynamic keyword indicates that the list can store values of any type,
  // and the list is initially empty (no elements).
  List<dynamic> dataList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState(); // to correctly initialize the state of the widget.
    fetchData();
  }

  // Future<void> type represents a future that doesn't return a value.
  // It is commonly used when working with asynchronous operations that don't produce a result
  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    const fetchURL = 'https://yif-library-be.onrender.com/book';
    final res = await http.get(Uri.parse(fetchURL));

    if (res.statusCode == 200) {
      final data = json.decode(res.body);
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
            title: Text('Error Occured'),
            content: Text('Something went wrong'),
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
        title: const Text('Flutter App'),
      ),
      body: isLoading
          ? const Center(
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
