import 'package:app_contatos/pages/add_contato_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Contatos - Back4app')),
      floatingActionButton: FloatingActionButton(
        child: const FaIcon(FontAwesomeIcons.userPlus),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddContatoPage()),
          );
        },
      ),
    );
  }
}
