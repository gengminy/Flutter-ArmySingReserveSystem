import 'package:flutter/material.dart';
import 'package:singroom2/sing_submenu.dart';

class PageMain extends StatefulWidget {
  PageMain({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _PageMainState createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {
  //예약 인원 수 (대기중인 인원)
  int _reservedMan = 0;

  //예약인원수 1 증가
  void increaseManCount() { setState(() { _reservedMan++; });  }
  //예약인원수 1 감소
  void decreaseManCount(){ setState(() { if(_reservedMan>0) _reservedMan--; }); }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>AppBarSubMenu())
              );
            }
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Text('현재 대기중인 인원', style: TextStyle(
                    fontSize: 25.0,
                  )),
                  Text('$_reservedMan', style: TextStyle(
                    fontSize: 100.0,
                    fontWeight: FontWeight.bold,
                  ),),
                ],
              ),
              alignment: Alignment.center,
            ),


            FloatingActionButton(
              onPressed: ()=>{ increaseManCount() },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}