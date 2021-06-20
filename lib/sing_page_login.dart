import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterstudy/sing_reserve_v1.dart';

class Reserve extends StatelessWidget {
  //군번
  final TextEditingController _militarySerialNumberController =
    TextEditingController(text: 'your_military_serial_number');
  //이름
  final TextEditingController _passwordController =
    TextEditingController(text: 'input password');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: Column(
        children: [
          SizedBox(height: 15.0),
          TextFormField(

            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          SizedBox(height: 15.0),
          TextFormField(
            controller: _militarySerialNumberController,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          TextFormField(
            controller: _passwordController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ],
      ),
    );
  }
}