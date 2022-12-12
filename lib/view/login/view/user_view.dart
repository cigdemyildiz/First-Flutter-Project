import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    const String kullaniciTitle = "Kullanıcı Profili";

    return Scaffold(
      body: Image.network("https://picsum.photos/200/300"),
    );
  }
}
