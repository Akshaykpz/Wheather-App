import 'package:flutter/material.dart';

import 'package:wheather_appnew/model.dart';
import 'package:wheather_appnew/views/aditional_info.dart';
import 'package:wheather_appnew/views/current_wheather.dart';

import '../../../views/data_service.dart';

class homescreen extends StatefulWidget {
  homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

final _dataservice = Dataservice();
final _textcontroller = TextEditingController();
WeatherResponse? _response;

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              )),
          centerTitle: true,
          elevation: 0.0,
          title: const Text(
            'Wheather App',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.lightBlue,
            Colors.white,
          ],
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            currentwheather(
                const Icon(
                  Icons.wb_sunny_rounded,
                  size: 68,
                  color: Colors.amber,
                ),
                ' ${_response?.tempInfo.temperature ?? 0.0}',
                _response?.weatherInfo.description ?? 'cold'),
            SizedBox(
              height: 90,
              child: Text('${_response?.cityName ?? 'Kerala'}',
                  style: const TextStyle(fontSize: 21)),
            ),
            if (_response != null) aditionalinfo("24", "2", "24.3"),
            TextField(
              controller: _textcontroller,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 5.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: () {
                  serach();
                },
                child: Text('Search')),
          ],
        ),
      ),
    );
  }

  void serach() async {
    final response = await _dataservice.dataserice(_textcontroller.text);
    setState(() => _response = response);
    // print(response.cityName);
    // print(response.tempInfo.temperature);
    // print(response.weatherInfo.description);
  }
}
