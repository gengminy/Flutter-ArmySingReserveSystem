import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//예약 리스트 형식 = [군번, 인원 수, 곡 수, 방 번호]
List<List<String>> _reserveList = [['20-71507777', '4', '1'],['21-76077777', '6', '2']];
int getReserveListLength(){
  return _reserveList.length;
}


class ReserveList extends StatefulWidget {
  ReserveList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ReserveListState createState() => _ReserveListState();
}

class _ReserveListState extends State<ReserveList>{

  //현재 사용중인 인원 = [군번, 인원 수, 곡 수, 입장시각]
  List<String> _usingMan = ['20-71507777', '2', '4', '1', '13:35'];
  //입장시간
  String _entryTime = '13:33';
  //입장후 지난 시간
  String _runTime = '00:00';

  //리스트 정보 ListView 위젯으로 반환해주는 함수
  Widget _createListView(){
    return ListView.separated(
      separatorBuilder: (context, index)=> Divider(color: Colors.black,),
      itemCount: _reserveList.length,
      itemBuilder: (BuildContext _context, int i){
          return ListTile(
            leading: Container(
              child: Text((i+1).toString(), style: TextStyle(fontSize: 20),),
            ),
            title: Text(_reserveList[i][0], style: TextStyle(fontSize: 17),),
            trailing: Text(_reserveList[i][1]+'곡', style: TextStyle(fontSize: 15),),
          );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('예약현황'),
      ),
      body: SingleChildScrollView(
        child:Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: _createListView(),
          ),
        ),
      ) ,
    );
  }
}