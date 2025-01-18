//

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DropdownButtonApp extends StatelessWidget {
  const DropdownButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('task1 ')),
        body: const Center(
          child: DropdownButtonExample(),
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  List<String> list = [];
  String? dropdownValue;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchModels();
  }

  Future<void> fetchModels() async {
    ApiData apiData = ApiData();
    List<String>? models = await apiData.getModel();
    setState(() {
      list = models ?? [];
      if (list.isNotEmpty) {
        dropdownValue = list[0];
      }
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CircularProgressIndicator();
    }

    if (list.isEmpty) {
      return const Text('داده ها پیدا نشد');
    }

    return Center(
      child: DropdownButton<String>(
        iconEnabledColor: Colors.red,
        menuWidth: 120,
        menuMaxHeight: 500,
        value: dropdownValue,
        icon: const Icon(Icons.car_rental),
        elevation: 15,
        style: const TextStyle(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

//test url
class ApiTest {
  String? url;
  ApiTest({this.url});

  Future<dynamic> getData() async {
    http.Response response = await http.get(Uri.parse(url!));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      return null;
    }
  }
}

//give data forom url and return list of string
class ApiData {
  List<String> nameOfCar = [];

  Future<List<String>?> getModel() async {
    ApiTest apiTest = ApiTest(
        url:
            'https://mashinoo.ir/applicationAPI/getCars.php?car_company=سایپا');
    dynamic data = await apiTest.getData();

    if (data != null) {
      for (dynamic type in data) {
        nameOfCar.add(type["car_name"]);
      }
    }
    return nameOfCar;
  }
}
