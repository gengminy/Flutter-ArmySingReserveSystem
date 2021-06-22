import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageMembership extends StatefulWidget {
  PageMembership({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _PageMembershipState createState() => _PageMembershipState();
}

class _PageMembershipState extends State<PageMembership> {
  String _pwdMatchText = '';
  final TextEditingController _pwdController =
    TextEditingController();
  final TextEditingController _pwdConfirmController =
    TextEditingController();

  void _pwdMatchTextChange() {
    setState(() {
      if (_pwdController.text == _pwdConfirmController.text)
        _pwdMatchText = '비밀번호가 일치하지 않습니다';
      else
        _pwdMatchText = '';
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueAccent,
        iconTheme: IconThemeData(color: Colors.white),
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
                Container(
                  child: Text('운용중대 노래방 예약 어플에 오신 것을 환영합니다.\n'
                    '신원 확인을 위해 정보를 기입해주세요.\n'
                    '계정 로그인 시 군번은 ID로 사용됩니다.', textAlign: TextAlign.center,),
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xFFe7edeb),
                      hintText: "이름",
                      prefixIcon: Icon(
                        Icons.account_circle_rounded,
                        color: Colors.grey,

                      )
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xFFe7edeb),
                      hintText: "군번",
                      prefixIcon: Icon(
                        Icons.work_outlined,
                        color: Colors.grey,
                      )
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xFFe7edeb),
                      hintText: "비밀번호",
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.grey,
                      )
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  onChanged: (_pwdConfirmController){ _pwdMatchTextChange(); },
                  controller: _pwdConfirmController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xFFe7edeb),
                      hintText: "비밀번호 확인",
                      prefixIcon: Icon(
                        Icons.lock_open,
                        color: Colors.grey,
                      )
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('$_pwdMatchText', style: TextStyle(color: Colors.red),),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 300, height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: RaisedButton(
                    onPressed: (){}, color: Colors.blueAccent, textColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular((30.0)))),
                    child: Text("승인요청", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  height: 100.0,
                )

            ],

          )

      ),
    )),
    );
  }
}