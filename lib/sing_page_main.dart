import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:singroom2/sing_page_reserve.dart';
import 'package:singroom2/sing_page_reserve_list.dart';
import 'package:singroom2/sing_page_profile.dart';

class PageMain extends StatefulWidget {
  PageMain({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _PageMainState createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {
  //로그인 정보 받아옴
  final String _userName = '경민';
  final String _userSerialNumber = '20-76022730';
  bool _userReserved = false;

  //예약 인원 수 (대기중인 인원)
  int _reservedMan = getReserveListLength();
  //내 순번
  int _myOrder = 1;
  //예약인원수 1 증가
  void increaseManCount() { setState(() { _reservedMan++; });  }
  //예약인원수 1 감소
  void decreaseManCount(){ setState(() { if(_reservedMan>0) _reservedMan--; }); }
  //예약인원 갱신
  void renewManCount(){ _reservedMan = getReserveListLength(); }

  //메뉴서랍 리스트타일 추가
  Widget _createDrawerListTile(IconData icon, String txt, Function onTap){
    return ListTile(
      leading: Icon(icon),
      title: Text(txt, style: TextStyle(fontSize: 18),),
      contentPadding: EdgeInsets.symmetric(horizontal: 15),
      onTap: (){ Navigator.of(context).pop(); onTap(); },
    );
  }

  Widget _createCancelFlatButton()=>FlatButton(
      child: Text('예'),
      onPressed: (){
        //cancel
      },
    );

  //로그아웃 알림창 출력
  Future<void> _logoutDialog(){
    return showDialog(context: context,
      builder: (context)=> AlertDialog(
        title: Text('로그아웃'),
        content: Text('정말로 로그아웃 하시겠습니까?'),
        actions: [
          FlatButton(
            child: Text('아니오'),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('예'),
            onPressed: (){
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          )
        ],
      )
    );
  }

  //앱 종료를 한번 더 물어보는 함수
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text('종료'),
          content: Text('정말로 앱을 종료하시겠습니까?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('아니요'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('예'),
        ),
      ],
    ),
    )) ?? false;
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return _onWillPop();
      },
      child: Scaffold(
        endDrawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      child: Text('경민'),
                      backgroundColor: Colors.white,
                      radius: 32,
                    ),
                    SizedBox(height: 5),
                    Container(
                      child: Text('$_userName', style: TextStyle(fontSize: 22),),
                    ),

                    Container(
                      child: Text('$_userSerialNumber', style: TextStyle(fontSize: 15)),
                    ),
                    SizedBox(height: 10),
                  ],
                ),


                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                ),
              ),
              _createDrawerListTile(Icons.account_circle_sharp, '프로필', () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Profile(title: '프로필',)));
              }),
              Divider(height: 0),
              _createDrawerListTile(Icons.person_add, '예약하기', () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Reserve(title: '예약하기',)));
              }),
              Divider(height: 0),
              _createDrawerListTile(Icons.library_books_sharp, '예약현황', () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ReserveList(title: '예약현황',)));
              }),
              Divider(height: 0),
              _createDrawerListTile(Icons.timer_off, '예약취소', () {
                  showDialog(context: context,
                     builder: (context)=> AlertDialog(
                       title: Text(_userReserved ? '예약취소':'알림'),
                       content: Text(_userReserved ? '정말로 취소 하시겠습니까?' : '예약 내역이 없습니다'),
                       actions: [
                         FlatButton(
                           child: Text(_userReserved ? '아니오' : '확인'),
                           onPressed: (){ Navigator.of(context).pop(); },
                         ),
                         if(_userReserved) _createCancelFlatButton(),
                       ],
                     )
                  );
                }
              ),
              Divider(height: 0),
              _createDrawerListTile(Icons.settings, '설정', () {}),
              Divider(height: 0),
              _createDrawerListTile(Icons.west, '로그아웃', _logoutDialog),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Text('현재 대기중인 인원', style: TextStyle(
                      fontSize: 27.0,
                    )),
                    SizedBox(height: 15),
                    Text('$_reservedMan', style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    )),
                    SizedBox(height: 20),
                    Text('내 순번 : '+'$_myOrder', style:TextStyle(
                      fontSize: 18.0,
                    ))

                  ],
                ),
                alignment: Alignment.center,
              ),
              SizedBox(height: 30.0,),
              Container(
                width: 300, height: 50,
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => Reserve(title: '예약하기',))
                    );
                  },
                  color: Colors.orangeAccent,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular((30.0)))),
                  child: Text("예약하기", style: TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 20.0,),
              Container(
                width: 300, height: 50,
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ReserveList(title: '예약현황',))
                    );
                  },
                  color: Colors.deepOrangeAccent,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular((30.0)))),
                  child: Text("예약현황", style: TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}