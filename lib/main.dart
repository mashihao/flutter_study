import 'package:flutter/material.dart';
import 'package:flutter_app/AnimationPage.dart';
import 'package:flutter_app/ChipPage.dart';
import 'package:flutter_app/ExpansionTilePage.dart';
import 'package:flutter_app/FutureBuilderPage.dart';
import 'package:flutter_app/GridViewPage.dart';
import 'package:flutter_app/ImagePage.dart';
import 'package:flutter_app/KeepAlivePage.dart';
import 'package:flutter_app/MyHomePage.dart';
import 'package:flutter_app/PavlovaPage.dart';
import 'package:flutter_app/RandomWords.dart';
import 'package:flutter_app/Routes.dart';
import 'package:flutter_app/ScreenUtilTest.dart';
import 'package:flutter_app/StateWidgetPage.dart';
import 'package:flutter_app/SwiperPage.dart';
import 'package:flutter_app/ThemePage.dart';
import 'package:flutter_app/Transform3D.dart';
import 'package:flutter_app/WrapPage.dart';
import 'package:flutter_app/animation_two.dart';
import 'package:flutter_app/backdrop_page.dart';
import 'package:flutter_app/custom_view.dart';
import 'package:flutter_app/draggable_dragtargets.dart';
import 'package:flutter_app/flutter_native_web.dart';
import 'package:flutter_app/locale/translations_delegate.dart';
import 'package:flutter_app/login_page.dart';
import 'package:flutter_app/rxdart/bloc_provider.dart';
import 'package:flutter_app/search_page.dart';
import 'package:flutter_app/share_page.dart';
import 'package:flutter_app/sqflite_page.dart';
import 'package:flutter_app/tab_page.dart';
import 'package:flutter_app/textField.dart';
import 'package:flutter_app/theme/app_theme.dart';
import 'package:flutter_app/video_player.dart';
import 'package:flutter_app/webview_page.dart';
import 'package:flutter_app/flutter_youtube_page.dart';
import 'package:flutter_app/youtube_player_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(BlocProvider(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //AppModel appModel = AppModel();
    final themeSelect = BlocProvider.of(context);
    return StreamBuilder(
      builder: _builder,
      stream: themeSelect.value,
      initialData: false,
    );
  }

  Widget _builder(BuildContext context, AsyncSnapshot snapshot) {
    return MaterialApp(
      theme: snapshot.data ? AppTheme().darkTheme : AppTheme().lightTheme,
      // start国际化
      localizationsDelegates: [
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale("zh"), Locale("en")],
      // end国际化

      // 真实界面
      home: Routes(),
      // Routes 里面， 点击事件 发送 路由事件，这边连接，统一处理 跳转界面
      routes: <String, WidgetBuilder>{
        //静态路由,无法传参
        'route': (_) => Routes(),
        'randomWords': (_) => RandomWords(),
        //主页面
        'Home': (_) => MyHomePage(),
        'Pavlova': (_) => PavlovaPage(),
        'Image': (_) => ImagePage(),
        'GridView': (_) => GridViewPage(),
        'StateWidget': (_) => StateWidgetPage(),
        'TextField': (_) => TextFieldAndCheckPage(),
        'KeepAlive': (_) => KeepAliveDemo(),
        'Swiper': (_) => SwiperPage(),
        'Wrap': (_) => WrapPage(),
        'Animation': (_) => AnimationPage(),
        'ScreenUtilPage': (_) => ScreenUtilTest(title: 'ScreenUtil测试'),
        'FutureBuilderPage': (_) => FutureBuilderPage(),
        'ThemePage': (_) => ThemePage(),
        'ChipPage': (_) => ChipPage(),
        'ExpansionTilePage': (_) => ExpansionTilePage(),
        'TransformPage': (_) => Transform3D(),
        'LoginPage': (_) => LoginPage(),
        'WebViewPage': (_) => WebViewPage(),
        'CustomViewPage': (_) => CustomViewPage(),
        'TabPae': (_) => TabPage(),
        'backdropPage': (_) => BackdropPage(),
        'Draggable': (_) => DraggableDragtargets(),
        'SharePage': (_) => SharePage(),
        'AnimationTwo': (_) => AnimationTwo(),
        'SearchPage': (_) => SearchPage(),
        'VideoPlayerPage': (_) => VideoPlayerPage(),
        'FlutterYoutubePage': (_) => FlutterYoutubePage(),
        'YoutubePlayerPage': (_) => YoutubePlayerPage(),
        'FlutterNativeWeb': (_) => FlutterNativeWebPage(),
        'SqfLitePage': (_) => SqfLite(),
      },
    );
  }
}
