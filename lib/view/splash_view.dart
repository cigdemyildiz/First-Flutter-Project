import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:od_news_app/view/login/view/news_home.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../core/constants/project_colors.dart';

import '../main.dart';
import 'login/viewmodel/article_list_viewmodel.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(
          children: [
            Image.asset('assets/png/splash_logo.png'),
          ],
        ),
      //Lottie.asset('assets/png/earth.json'),
        backgroundColor: ProjectColors.mainColor,
        nextScreen:ChangeNotifierProvider(
        create: (context) => ArticleListViewModel(),
    child: const NewsPage()),
        splashIconSize: 200,
        duration: 4000,
        splashTransition: SplashTransition.scaleTransition, //size transition-
        pageTransitionType: PageTransitionType.fade,
        animationDuration: const Duration(seconds: 1),

    );
  }
}


//#FFDE59
//https://lottiefiles.com/128709-earth