import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Reserve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('예약하기'),
      ),
      body: Column(
        children: [
          SizedBox(height: 15.0),
          TextFormField(

            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          SizedBox(height: 15.0),
          TextFormField(
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ],
      ),
    );
  }
}