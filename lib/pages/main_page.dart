import 'package:app_contatos/models/contatos_back4app_model.dart';
import 'package:app_contatos/pages/add_contato_page.dart';
import 'package:app_contatos/repositories/contato_repository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool loading = false;
  var repository = ContatoRepository();
  var _contatos = ContatosBack4appModel([]);

  @override
  void initState() {
    carregaContatos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Contatos - Back4app')),
      body: loading
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Carregando...',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                CircularProgressIndicator(),
              ],
            ))
          : Container(
              child: ListView.builder(
                  itemCount: _contatos.contatos.length,
                  itemBuilder: (BuildContext bc, int index) {
                    return Dismissible(
                      key: Key(_contatos.contatos[index].objectId!),
                      child: GestureDetector(
                        onTap: () async {
                          // var ret = await Navigator.push(
                          //   context,
                          //    MaterialPageRoute(builder: (context) => EdicaoCepPage(_ceps.ceps[index]),),
                          // );

                          // if (ret != null && ret) {
                          //    carregaCeps();
                          //  }
                        },
                        child: ListTile(
                          title: Text(_contatos.contatos[index].nome.toString()),
                          subtitle: Text('${_contatos.contatos[index].telefone}'),
                          trailing: InkWell(
                              child: const Icon(Icons.delete),
                              onTap: () {
                                remover(index);
                              }),
                        ),
                      ),
                      onDismissed: (DismissDirection dis) {
                        remover(index);
                      },
                    );
                  })),
      floatingActionButton: FloatingActionButton(
        child: const FaIcon(FontAwesomeIcons.userPlus),
        onPressed: () async {
          var ret = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddContatoPage()),
          );

          if (ret != null && ret) {}
        },
      ),
    );
  }

  void carregaContatos() async {
    setLoading(true);
    _contatos = await repository.findAll();
    setLoading(false);
  }

  void setLoading(bool val) {
    setState(() {
      loading = val;
    });
  }

  void remover(int index) {
    showDialog(
        context: context,
        builder: (BuildContext bc) {
          return AlertDialog(
            title: const Text('Deseja esse contato ?'),
            content: Text(_contatos.contatos[index].nome.toString()),
            actions: [
              TextButton(
                  onPressed: () async {
                    carregaContatos();
                    Navigator.pop(context);
                  },
                  child: const Text('Não')),
              TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    setLoading(true);
                    await repository.remover(_contatos.contatos[index]);
                    carregaContatos();
                  },
                  child: const Text('Sim')),
            ],
          );
        });
  }
}
