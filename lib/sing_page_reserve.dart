import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Reserve extends StatefulWidget {
  Reserve({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ReserveState createState() => _ReserveState();
}

class _ReserveState extends State<Reserve>{
  final String _userName = '경민'; //사용자 이름
  final String _userSerialNumber = '20-76667666'; //사용자 군번
  String _predictingEntryTime = '13:55'; //예상입장시각
  final TextEditingController _songCountController = TextEditingController();
  bool _confirmChecked = false;

  //요소들 제목 텍스트 만들어주는 함수
  Widget _buildText(String txt) => Container(
    alignment: Alignment.centerLeft,
    child: Row(
      children:[
        SizedBox(width: 5,),
        Text(txt, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
      ],
    )
  );

  //요소들 텍스트 필드 만들어주는 함수
  Widget _buildTextField(TextEditingController _controller){
    return TextField(
    controller: _controller,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
    ),
    readOnly: true,
  ); }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('예약하기'),
      ),
      body: SingleChildScrollView(
        child:Container(
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
                Container(
                  child: Text('예약 정보를 확인해주세요', style: TextStyle(fontSize: 20),),
                ),
                SizedBox(height: 30),
                Divider(),
                ListTile(
                  leading: Text('이름', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  trailing: Text('$_userName', style: TextStyle(fontSize: 20),),
                ),
                Divider(),
                ListTile(
                  leading: Text('군번', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  trailing: Text('$_userSerialNumber', style: TextStyle(fontSize: 18),),
                ),
                Divider(),
                ListTile(
                  leading: Text('예약 곡 수', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  trailing: Container(
                    width: 100,
                    child:  TextField(
                      controller: _songCountController,
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      onChanged: (_songCountController) {
                        if(_songCountController.isEmpty){
                          print('Song Count Error');
                        }
                      },
                    ),
                  )
                ),
                Divider(),
                ListTile(
                  leading: Text('예상 입장시각', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  trailing: Text('$_predictingEntryTime', style: TextStyle(fontSize: 18),),
                ),
                Divider(),
                SizedBox(height: 10,),
                ListTile(
                    onTap: () {
                      setState(() {
                        _confirmChecked = !_confirmChecked;
                      });
                    },
                    leading: Checkbox(
                      value: _confirmChecked,
                      onChanged: (value){},
                    ),
                    title: Text('위 정보를 모두 확인하였습니다')
                ),
                SizedBox(height: 30,),

                Container(
                  width: 300, height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: RaisedButton(
                    onPressed: () {

                    },
                    color: Colors.orangeAccent,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular((30.0)))),
                    child: Text("예약하기", style: TextStyle(
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