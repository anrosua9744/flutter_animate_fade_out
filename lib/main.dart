import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Opacity Demo';

    return MaterialApp(
      title: appTitle,
      // MYhomePage 위젯 라우트를 home으로 설정, 생성자로 apptitle 값 전달
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  // 생성자. title 아규먼트를 전달받아 필드에 저장
  MyHomePage({Key key, this.title}) : super(key: key);

  //  StatefulWidget은 createState() 메소드를 통해 상태를 생성한다.
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
// State를 상속하는 클래스
class _MyHomePageState extends State<MyHomePage> {
  // 컨테이너의 표시 여부를 결정하기 위한 필드값
  bool _visible = true;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // 투명도 애니메이션 효과를 제공하는 위젯 추가
        child: AnimatedOpacity(
          // 필드값에 따라 출력 여부를 토클함
          opacity: _visible ? 1.0:0.0,
          // 애니메이션 효과에 소요되는 시간 설정
          duration: Duration(milliseconds: 500),
          // 컨테이너 추가
          child: Container(
            //컨테이너 너비 ,높이 , 색상 설정
            width: 200.0,
            height: 200.0,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //상태값 변경
          setState((){
            // 컨테이너의 표시여부를 토글
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: Icon(Icons.flip),
      ),
    );
  }

  //StatefulWidget은 createState() 메소드를 통해 상태를 생성한다.


}
