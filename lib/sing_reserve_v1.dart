import 'package:flutter/material.dart';
import 'package:flutterstudy/sing_submenu.dart';
import 'package:flutterstudy/sing_page_reserve.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: '운용중대 노래방 예약 어플',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(
        title: '운용중대 노래방 예약 도우미',

      ),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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