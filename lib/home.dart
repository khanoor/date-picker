// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String CurrentDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    Future<void> getCurrent(BuildContext context) async {
      final DateTime? date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          // firstDate: DateTime(200),
          // lastDate: DateTime(3000));
          firstDate: DateTime.now().subtract(Duration(days: 365 * 2)),
          lastDate: DateTime.now().add(Duration(days: 365 * 2)));
      if (date != null) {
        setState(() {
          CurrentDate = DateFormat("yyyy-MM-dd").format(date);
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Date Picker"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  "Date: $CurrentDate ",
                  style: TextStyle(fontSize: 20),
                ),
                IconButton(
                    onPressed: () {
                      getCurrent(context);
                    },
                    icon: Icon(
                      Icons.date_range,
                      size: 30,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
