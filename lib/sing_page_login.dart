import 'package:flutter/material.dart';
import 'package:singroom2/sing_page_main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: '운용중대 노래방 예약 어플',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LoginPage(
        title: 'Login',
      ),

    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.blueAccent,
                Colors.blue,
              ],
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
              ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 36.0, horizontal: 24.0
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("운용 노래방 예약", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 33,
                        color: Colors.white,
                      ),),
                    ],
                  ),
                )

              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular((30)),
                        topRight: Radius.circular((30)),
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                              Icons.assignment_ind,
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
                              hintText: "비밀번호",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.grey,
                              )
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Container(
                            width: 300, height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            child: RaisedButton(
                                onPressed: (){}, color: Colors.blueAccent, textColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular((30.0)))),
                              child: Text("로그인", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                            ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: 300, height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          child: RaisedButton(
                            onPressed: (){}, color: Colors.blueGrey, textColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular((30.0)))),
                            child: Text("승인요청", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //******삭제예정(테스트용)***********
                              RaisedButton(
                                onPressed: (){
                                  //Navigator.of(context).pop();
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context)=>PageMain(title: '운용중대 노래방 도우미',))
                                  );
                                },
                                color: Colors.white,
                                child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                    child: Text(
                                      "무시(test)",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                      ),
                                    )
                                ),
                              ),
                              //******삭제예정(테스트용)***********

                            ],

                          )

                        )
                      ],

                    )

                  ),

                )

              ),
            ],
          )
        ),

        )

        );
  }
}