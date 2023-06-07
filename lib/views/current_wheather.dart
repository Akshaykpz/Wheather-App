import 'package:flutter/cupertino.dart';

Widget currentwheather(
  Icon icon,
  String temp,
  String location,
) {
  return Container(
    width: 410,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        SizedBox(
          height: 30,
          child: Text(
            temp,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 30,
          child: Text(
            location,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
