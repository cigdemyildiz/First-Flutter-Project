import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:od_news_app/view/login/view/settings_view.dart';
import 'package:od_news_app/view/login/view/user_view.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/components/navbar/NavigationDrawer.dart';
import '../../../core/constants/project_colors.dart';
import '../model/category.dart';
import '../viewmodel/article_list_viewmodel.dart';
import 'favs_view.dart';
import 'home.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final String _title = "Ortadoğu'ya Dair";
  int index = 1;

  List<Category> categories = [
    Category('business', 'İş'),
    //Category('entertainment', 'Eğlence'),
    Category('general', 'Genel'),
    Category('health', 'Sağlık'),
    Category('science', 'Bilim'),
    Category('sports', 'Spor'),
    Category('technology', 'Teknoloji'),
  ];

  final bottomNavBarScreens = [
    const UserPage(),
    const HomePage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ArticleListViewModel>(context); // vmnin instanceı

    final bottomNavBarItems = <Widget>[
      const Icon(Icons.person_outline),
      const Icon(Icons.home_outlined),
      const Icon(Icons.settings_outlined),
    ];

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      drawer: const NavigationDrawer(),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          height: 55,
          index: index,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.black,
          color: ProjectColors.mainColor,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
          items: bottomNavBarItems,
        ),
      ),
      appBar: AppBar(
        title: Text(_title),
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: const Icon(Icons.notifications, color: Colors.black))
        // ],
      ),
      body: bottomNavBarScreens[index]
    );
  }
}