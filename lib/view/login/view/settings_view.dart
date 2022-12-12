import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/dark_theme_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool valNotify1 = true;
  bool valNotify2 = false;
  bool valNotify3 = false;

  onChangeFunction1(bool newValue1) {
    setState(() {
      valNotify1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2) {
    setState(() {
      valNotify2 = newValue2;
    });
  }

  onChangeFunction3(bool newValue3) {
    setState(() {
      valNotify3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                children: const [
                  Icon(Icons.person_outline, color: Colors.amberAccent),
                 // SizedBox(width: 10),
                  Text("Profil",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          //const Divider(),

          //const SizedBox(height: 10),
          Expanded(flex: 1, child: SizedBox(width: 350, child: buildAccountOption(context, "Kullanıcı adı"))),
         // Expanded(flex: 1, child: SizedBox(width: 350, child: buildAccountOption(context, "İçerik ayarları"))),
          Expanded(flex: 1, child: SizedBox(width: 350, child: buildAccountOption(context, "Dil seçenekleri"))),
          //const SizedBox(height: 40),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                children: const [
                  Icon(Icons.settings_outlined, color: Colors.amberAccent),
                  //SizedBox(width: 10),
                  Text("Genel Ayarlar",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          // const Divider(),

          //buildGeneralOption("Koyu tema", valNotify1, onChangeFunction1),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                SizedBox(
                  width: 350,
                  child: SwitchListTile(
                    title: const Text('Koyu tema',
                        style: TextStyle(color: Colors.black)),
                    secondary: Icon(themeState.darkTheme
                        ? Icons.dark_mode_outlined
                        : Icons.light_mode_outlined),
                    onChanged: (bool value) {
                      setState(() {
                        themeState.darkTheme = value;
                      });
                    },
                    value: themeState.darkTheme,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(flex: 3, child: SizedBox(width: 350)),

          //buildGeneralOption("Profil Aktifliği", valNotify2, onChangeFunction2),
        ],
      ),
    );
  }

  Padding buildGeneralOption(
      String title, bool value, Function onChangeMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey)),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.amberAccent,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                onChangeMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text("Option 1"),
                    Text("Option 2"),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Close"))
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey)),
            const Icon(Icons.arrow_drop_down_outlined, color: Colors.grey)
          ],
        ),
      ),
    );
  }
}
