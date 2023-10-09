import 'package:app_contatos/models/contato_model.dart';
import 'package:app_contatos/repositories/contato_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddContatoPage extends StatefulWidget {
  @override
  _AddContatoPageState createState() => _AddContatoPageState();
}

class _AddContatoPageState extends State<AddContatoPage> {
  var controllerNome = TextEditingController(text: '');
  var controllerTelefone = TextEditingController(text: '');
  var repository = ContatoRepository();
  var maskFormatter = MaskTextInputFormatter(
    mask: '+## (##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Novo Contato')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: controllerNome,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "Nome",
                  hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                  labelStyle: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                  controller: controllerTelefone,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: "Telefone",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                    labelStyle: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  inputFormatters: [maskFormatter]),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () {

                var contato = ContatoModel.vazio();
                contato.telefone = controllerTelefone.text;
                contato.nome = controllerNome.text;
                repository.criar(contato);

                Navigator.pop(context, true);

              }, child: const Text('Salvar')),
            ],
          ),
        ));
  }
}
