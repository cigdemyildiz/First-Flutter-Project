import 'package:flutter/material.dart';
import 'package:od_news_app/view/login/view/news_home.dart';
import 'package:od_news_app/view/login/view/settings_view.dart';
import 'package:provider/provider.dart';

import '../../../view/login/view/favs_view.dart';
import '../../../view/login/view/home.dart';
import '../../../view/login/view/user_view.dart';
import '../../../view/login/viewmodel/article_list_viewmodel.dart';
import '../../constants/project_colors.dart';


class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            buildHeader(context),
            buildMenuItems(context),

          ],
        ),
      ),

    );
  }
  Widget buildHeader (BuildContext context) => Material(
    child: InkWell(
      onTap: () {
        Navigator.pop(context);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const UserPage(),
        ));
      },
      child: Container(
        color: Colors.black,
        padding: EdgeInsets.only(
        top: 15 + MediaQuery.of(context).padding.top,
        bottom: 15,
        ),
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Çiğdem Yıldız', style: TextStyle(color: Colors.white)),
              accountEmail: const Text('cigdemyildiz@gmail.com', style: TextStyle(color: Colors.white)),
              currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.network('https://picsum.photos/200/300',
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,

                    ),
                  )
              ),
              decoration: const BoxDecoration(
                color: Colors.black,

              ),
            ),
          ],
        ),
      ),
    ),
  );


  Widget buildMenuItems (BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16, //vertical spacing
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text("Home"),
          onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder:(context)=>  ChangeNotifierProvider(
                create: (context) => ArticleListViewModel(),
                child: const NewsPage()),
        )),
        ),

        const Divider(color: Colors.black),

        ListTile(
          leading: const Icon(Icons.person_outline),
          title: const Text("Profil"),
          onTap: () {
            //close navigation drawer before
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const UserPage(),
           )); }
           ),


            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text("Ayarlar"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SettingsPage(),
                ));},
            ),




    ],

  ),
  );
}
