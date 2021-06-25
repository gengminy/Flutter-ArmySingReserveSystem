import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class Profile extends StatefulWidget {
  Profile({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{
  final String _userName = '경민'; //사용자 이름
  final String _userSerialNumber = '20-76667666'; //사용자 군번
  final String _registerDate = '2021-06-25'; //가입일자
  String _predictingEntryTime = '13:55'; //예상입장시각
  final TextEditingController _songCountController = TextEditingController();
  bool _confirmChecked = false;


  Widget _createCustomListTile(String leadingTxt, String titleTxt){
    return ListTile(
      leading: Text(leadingTxt, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      trailing: Text(titleTxt, style: TextStyle(fontSize: 18),),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('프로필'),
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
                Stack(
                  children: [
                    ClipOval(
                      child: Material(
                        child: Ink.image(
                          image: NetworkImage('https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),

                          fit: BoxFit.cover,
                          width: 128,
                          height: 128,
                          child: InkWell(onTap: (){}),
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      right: 4,
                      child: ClipOval(
                        child: Container(
                            padding: EdgeInsets.all(3),
                            color: Colors.white,
                            child: ClipOval(
                              child: Container(
                                color: Colors.red,
                                padding: EdgeInsets.all(8),
                                child: Icon(Icons.edit, size: 20, color: Colors.white,)
                              )
                            )
                        )
                      )
                    )
                  ]
                ),
                SizedBox(height: 30),
                Divider(),
                _createCustomListTile('이름', '$_userName'),
                Divider(),
                _createCustomListTile('군번', '$_userSerialNumber'),
                Divider(),
                _createCustomListTile('가입일자', '$_registerDate'),
                Divider(),

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
                    child: Text('정보수정', style: TextStyle(
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