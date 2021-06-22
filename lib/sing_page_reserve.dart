import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Reserve extends StatefulWidget {
  Reserve({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ReserveState createState() => _ReserveState();
}

class _ReserveState extends State<Reserve>{
  //회원정보 가져와서 아래 컨트롤러에 값 넣어주면 자동으로 나옴
  final TextEditingController _idController = TextEditingController(text:'이름');
  final TextEditingController _serialNumberController = TextEditingController(text:'군번');

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
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildText('이름'),
                _buildTextField(_idController),
                SizedBox( height: 20.0, ),
                _buildText('군번'),
                _buildTextField(_serialNumberController),
                SizedBox( height: 20.0, ),
                TextField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                  ),
                  readOnly: true,
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ) ,
    );
  }
}