import 'package:flutter/material.dart';
import 'package:od_news_app/core/constants/theme_data.dart';
import 'package:od_news_app/provider/dark_theme_provider.dart';
import 'package:od_news_app/view/login/view/news_home.dart';
import 'package:od_news_app/view/login/viewmodel/article_list_viewmodel.dart';
import 'package:od_news_app/view/splash_view.dart';
import 'package:provider/provider.dart';





void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme = //setDarkTheme
    await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_){
          return themeChangeProvider;
        })
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {


          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: MyTheme.themeData(themeProvider.darkTheme, context),

              home: const SplashScreen(),

          );
        }
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  final String _title = "Ortadoğu'ya Dair";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: const Icon(Icons.chevron_left, color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mark_email_unread_sharp, color: Colors.black),
          ),
          //const Center(child: CircularProgressIndicator()),
        ],
      ),
      body: Column(children: const []),
    );
  }
}

