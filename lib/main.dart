import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player = AudioPlayer();

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final tabs = [
    Center(child: screen1()),
    Center(child: screen2()),
    Center(child: screen3()),
    Center(child: screen4()),
  ];

  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('期中考自傳'),
        ),
        body: tabs[_currentindex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.amber,
          selectedItemColor: Colors.white,
          selectedFontSize: 18.0,
          unselectedFontSize: 14.0,
          iconSize: 30.0,
          currentIndex: _currentindex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Work',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentindex = index;
              if (index != 0) {
                player.stop();
              }
            });
          },
        ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {
  final String s1 = '我出生在一個平凡的家庭，電腦是我的興趣，'
      '小時候父母給我了一本有關電腦維修的書籍，開啟了我對有關電腦'
      '領域的興趣。';

  @override
  Widget build(BuildContext context) {
    player.play(AssetSource("Free_Test_Data_1MB_MP3.mp3"));

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //先放個標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text("關於我",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
          ),
          //文字自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(
              s1,
              style: TextStyle(fontSize: 20),
            ),
          ),

          //放一張照片
          Container(
            color: Colors.redAccent,
            child: Image.asset('images/f1.jpg'),
            height: 200,
            width: 200,
          ),
          SizedBox(
            height: 30,
          ),

          //一列放兩個圖
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('images/f1.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                ),
              ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.purple,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('images/f1.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: ListView(
        children: [
          Text('學習歷程'),
          Text('桃園市立富台國小\n'
              '桃園私立六和高中國中部\n'
              '桃園私立六和高中資訊科\n'
              '國立高雄科技大學 資訊工程系\n')
        ],
      ),
    );
  }
}

class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //有多種排版方式, 此處以最直覺的方式將每一列放文字內容
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("短期目標"),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              child: ListView(
                children: [
                  //條列式參考
                  Text('1. 考好多益'),
                  Text('2. 物件導向語言'),
                  Text('3. 考取證照'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("中期目標"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              child: ListView(
                children: [
                  Text('1. 擴展人脈'),
                  Text('2. 考研究所'),
                  Text('3. 專題研究'),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("長期時期"),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              child: ListView(
                children: [
                  Text('1.擴展人脈 '),
                  Text('2.畢業即出社會'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: ListView(
        children: [
          Text('專案方向'),
          Text('豹利雲—雲端一體化管理平台'
              '服務雲端化是近年來的趨勢，但放眼望去國內的平臺提'
              '供者各有缺點，例如價格便是促使使用者轉而前往國外'
              '平臺的因素之一，如何在本土現有供應商和境外大型廠'
              '商中求生存便是門學問，此計畫將探討如何架設雲端平台。')
        ],
      ),
    );
  }
}
