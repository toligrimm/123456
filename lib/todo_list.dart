import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    loadSharedPreferences();
    super.initState();
  }

  void loadSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();

  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences'),
      ),
      body: Scrollbar(
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'First name'
              ),
              controller: firstNameEditingController,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Last name'
              ),
              controller: lastNameEditingController,
            ),
            ElevatedButton(
              onPressed: () {
                saveMapToSP(
                    {
                      'firstName': firstNameEditingController.text,
                      'lastName': lastNameEditingController.text,
                    },
                    'jsonData'
                );
                firstNameEditingController.clear();
                lastNameEditingController.clear();
              },
              child: const Text('Save data'),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () => loadData(),
              child: const Text('Load text'),
            ),
            Text(text),
          ],
        ),
      ),
    );
  }

  void loadData(){
    Map data = getMapFromSP('jsonData');
    setState(() {
      firstNameEditingController.text = data['firstName'];
      lastNameEditingController.text = data['lastName'];
    });
  }

  void saveStringToSP(String key, String value){
    if(value.isNotEmpty && key.isNotEmpty) {
      sharedPreferences.setString(key, value);
    }
  }

  String getStringFromSP(String key){
    if(key.isNotEmpty){
      String? value = sharedPreferences.getString(key);
      if(value != null) {
        return value;
      } else {
        return '';
      }
    }else{
      return '';
    }
  }

  void saveMapToSP(Map map, String key){
    String jsonString = jsonEncode(map);
    saveStringToSP(key, jsonString);
  }

  Map getMapFromSP(String key){
    String string = getStringFromSP(key);
    if(string != null && string.isNotEmpty) {
      return jsonDecode(string);
    } else {
      return {};
    }
  }
}