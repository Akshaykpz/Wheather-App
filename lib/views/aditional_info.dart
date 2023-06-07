import 'package:flutter/material.dart';

TextStyle titlefront =
    const TextStyle(fontWeight: FontWeight.w700, fontSize: 12);
Widget aditionalinfo(
  String wind,
  String humdity,
  String feelLike,
) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(10),
    child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [Text("windf"), Text("preserur")],
              // ),
            ],
          )
        ]),
  );
}
