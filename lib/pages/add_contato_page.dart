import 'dart:io';

import 'package:app_contatos/models/contato_model.dart';
import 'package:app_contatos/repositories/contato_repository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddContatoPage extends StatefulWidget {
  ContatoModel contato;

  AddContatoPage(this.contato);

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
  File? foto;
  @override
  void initState() {
    controllerNome.text = widget.contato.nome;
    controllerTelefone.text = widget.contato.telefone;
    if(widget.contato.imgUrl.isNotEmpty){
      foto = File(widget.contato.imgUrl);
    }
    super.initState();
  }

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
              InkWell(
                onTap: () async {
                  final ImagePicker _picker = ImagePicker();
                  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                  if(image != null) {
                    widget.contato.imgUrl = image.path;
                    foto = File(widget.contato.imgUrl);
                    setState(() {

                    });
                  }
                },
                child: foto == null ? Container(
                  width: 120, // Defina a largura do círculo
                  height: 120, // Defina a altura do círculo
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle, // Define a forma como círculo
                    color: Colors.blue, // Define a cor de fundo do círculo
                  ),
                  child: const Center(
                    child: Icon(
                      FontAwesomeIcons.image, // Ícone desejado
                      color: Colors.white, // Cor do ícone
                      size: 50, // Tamanho do ícone
                    ),
                  ),
                ): ClipOval(
                  child: CircleAvatar(radius: 65,
                      child: foto == null
                          ? const Icon(Icons.image)
                          : Image.file(foto!),),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Adicionar imagem',
                style: TextStyle(color: Colors.lightBlue),
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
              ElevatedButton(
                  onPressed: () {
                    var contato = ContatoModel.vazio();
                    contato.telefone = controllerTelefone.text;
                    contato.nome = controllerNome.text;
                    contato.imgUrl = widget.contato.imgUrl;
                    repository.criar(contato);

                    Navigator.pop(context, true);
                  },
                  child: const Text('Salvar')),
            ],
          ),
        ));
  }
}
