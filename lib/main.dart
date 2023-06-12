import 'package:flutter/material.dart';

class Player{
  String? name;// 네임을 가질수도 가지지 않을수도 있음

  Player({required this.name});

}


void main() {
  //runApp은 flutter/material.dart에서 가져온것
  //하나의 argument를 필요로 하는데 그것이 바로 widget
  //위젯은 레고블럭같음  플러터는 위젯으로 구성되어있음.
  //위젯을 만든다는것은 클래스를 만든다는것
  var nico = Player(name :'nico');
  runApp(App());
}


//이상태로는 위젯이 아님.
class MyApp{
}

//클래스가 위젯이 되기 위해서는 flutter SDK안에 있는 3개의 core Widget중 하나를 상속받아야 함
class App extends StatelessWidget{
  //StatelessWidget를 구현하려면(위젯이 된다는 것은) buid method를 구현해야 하는 계약사항이 있음.
  //build메소드는 widger의 UI를 만드는것임

  //statelessWidget에 build가 있으니 이것을 나만의 build로 재구현하기위해 override를 사용함.
  //이 위젯은 우리앱의 root라는것. 모든 위젯,버튼,ui가 이 위젯으로부터 나오게 됨.
  @override
  Widget build(BuildContext context) {
    //root위젯은 머터리얼, cupertino중의 하나를 리턴해야 함. (구글과 애플의 디자인 시스템. 보통 머터리얼을 선택함)
    return MaterialApp(
      //플러터 개발의 규칙: 화면이 sscaffold가 들어가야 된다.(화면의 구조를 제공. 예를들어 top bar 나 앱의 body를 제공함)
      home: Scaffold(
        //옵션중에 appbar와 body를 필요함.
        //스캐폴드도 생성자로 생성됨, 네임드 파라미터를 사용함
        appBar: AppBar(
          title: Text("Hello flutter!"),
        ),
        body: Center(
          //center 위젯은 child를 가운데 정렬해주는 위젯임
          child: Text("Hello world!"),
        ),
      ),
    );
  }
}
//1. 위젯을 사용할 때 마다 우리는 클래스를 인스턴트 화 하고있다.(new를 생략함.)
//2.