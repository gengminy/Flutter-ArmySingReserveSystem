import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ReserveComplete extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('예약완료'),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height*7/9,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Icon(Icons.check_circle_outline, size: 150, color: Colors.orangeAccent,),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text('예약이 완료되었습니다!', style: TextStyle(fontSize: 25),),
                ),
                SizedBox(height: 50),
                Container(
                  width: 300, height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: RaisedButton(
                    onPressed: () { Navigator.of(context).pop(); },
                    color: Colors.orangeAccent,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular((30.0)))),
                    child: Text("완료", style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ) ,
    );
  }
}