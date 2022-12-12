import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:od_news_app/core/constants/project_colors.dart';

class MyTheme {
static ThemeData themeData(bool isDarkTheme, BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: isDarkTheme ? Colors.grey.shade700 :Colors.white,
   //primarySwatch: Colors.purple,
    primaryColor: isDarkTheme ? Colors.black : Colors.grey.shade300,
    backgroundColor: isDarkTheme ? Colors.grey.shade700 : Colors.white,
    indicatorColor: isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),
    hintColor: isDarkTheme ? Colors.grey.shade300 : Colors.grey.shade800,
    highlightColor: isDarkTheme ? const Color(0xff372901) : const Color(0xffFCE192),
    hoverColor: isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),
    focusColor: isDarkTheme ? const Color(0xff0B2512) : const Color(0xffA8DAB5),
    disabledColor: Colors.grey,
    cardColor: isDarkTheme ? Colors.white : Colors.white,
    canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
    //brightness: isDarkTheme ? Brightness.dark : Brightness.light,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: isDarkTheme ? const ColorScheme.dark() : const ColorScheme.light()),

    appBarTheme: Theme.of(context).appBarTheme.copyWith(
        backgroundColor: isDarkTheme ? Colors.black : ProjectColors.mainColor,
        elevation:0,
        centerTitle: true,
        iconTheme: IconThemeData(color: isDarkTheme ? Colors.white : Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: TextStyle(color: isDarkTheme ? ProjectColors.mainColor : Colors.black, fontSize: 25
    )),


    primarySwatch: Colors.amber,
    listTileTheme: ListTileThemeData(iconColor: isDarkTheme ? Colors.white : Colors.black, textColor: isDarkTheme ? Colors.grey.shade700 : Colors.black),

    dividerTheme: DividerThemeData(color: isDarkTheme ? Colors.grey : Colors.black),

    );

}
}