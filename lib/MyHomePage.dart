import 'package:flutter/material.dart';
import 'package:flutter_app/FavoriteWidget.dart';
import 'package:flutter_app/PavlovaPage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomePage extends StatelessWidget {
  final String tag;

  MyHomePage({this.tag, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    //  start 定义 需要用到的 widget
    Widget titleSection = Container(
      //定义  padding
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ),
          //喜欢组件
          FavoriteWidget()
        ],
      ),
    );

    //上图下字 widget
    Widget BuildButtonColumn(
        IconData icon, String label, GestureTapCallback onTap) {
      Color color = Theme.of(context).primaryColor;
      // 点击事件
      return GestureDetector(
        onTap: onTap,
        child: Container(
          // 添加背景颜色，外部点击区域
            color: Colors.red,
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Icon(icon, color: color),
                new Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  child: new Text(
                    label,
                    style: new TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: color,
                    ),
                  ),
                ),
              ],
            )),
      );
    }

    Widget buttonSection = Container(
      child: Row(
        // 均匀分开
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          BuildButtonColumn(Icons.call, 'CALL', () {
            Fluttertoast.showToast(msg: "CALL");
          }),
          BuildButtonColumn(Icons.near_me, 'ROUTE', () {
            Fluttertoast.showToast(msg: "ROUTE");
          }),
          BuildButtonColumn(Icons.share, 'SHARE', () {
            Fluttertoast.showToast(msg: "SHARE");
          }),
        ],
      ),
    );
    Widget textSection = new Container(
      // 左右两边间距
      padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 32.0),
      child: new Text(
        '''
Lake1 Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. 
        ''',
        softWrap: true,
      ),
    );

    FloatingActionButton floatBtn = FloatingActionButton(
      foregroundColor: Colors.red,
      onPressed: _floatOnPress,
      tooltip: '长按显示',
      child: Icon(Icons.favorite),
    );

    RaisedButton btn = new RaisedButton(
        onPressed: () {
          print('tt');
          Navigator.of(context).pushNamed('Pavlova');
        },
        color: Colors.green,
        child: new Text('go to Pavlova',
            style: new TextStyle(color: Colors.white)));

    //  start 定义 需要用到的 widget

    //最后排放 各种  widget
    return Scaffold(
      appBar:
          AppBar(title: Text('Startup Name Generator'), actions: <Widget>[]),
      body: ListView(
        children: [
          //https://flutterchina.club/animations/hero-animations/
          // Hero指的是可以在路由(页面)之间“飞行”的widget。
          //使用Flutter的Hero widget创建hero动画。
          //将 hero从一个路由飞到另一个路由。
          //将 hero 的形状从圆形转换为矩形，同时将其从一个路由飞到另一个路由的过程中进行动画处理。
          //Flutter中的Hero widget实现了通常称为 共享元素转换 或 共享元素动画的动画风格。
          Hero(
            tag: tag ?? 'hero',
            child: Image.asset(
              'images/jay.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
          ),
          titleSection,
          buttonSection,
          textSection,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: btn,
          )
        ],
      ),
      floatingActionButton: floatBtn,
    );
  }

  void _floatOnPress() {
    Fluttertoast.showToast(msg: "press");
  }
}
