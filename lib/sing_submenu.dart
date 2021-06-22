import 'package:flutter/material.dart';
import 'package:singroom2/sing_page_reserve.dart';

class AppBarSubMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("메뉴"),
      ),
      body: ListView(
        children: [
          ListTile( title: Text('예약하기', textScaleFactor: 1.5,), onTap: ()=>{
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>Reserve(title: '예약하기',))
            )
          }),
          Divider(),

        ],

      ),

    );
  }
}