
import 'package:app_contatos/models/contatos_back4app_model.dart';

import '../models/contato_model.dart';
import 'dio/back4app_custom_dio.dart';

class ContatoRepository {
  final _dioCustom = Back4appCustomDio();

  Future<ContatosBack4appModel> findAll() async {
    var url = '/Contato';
    var result = await _dioCustom.dio.get(url);
    return ContatosBack4appModel.fromJson(result.data);
  }

  Future<ContatosBack4appModel> findById(var objectId) async {
    var url = '/Contato';
    url = '$url?where={\"objectId":\"$objectId"}';
    var result = await _dioCustom.dio.get(url);
    return ContatosBack4appModel.fromJson(result.data);
  }

  Future<void> criar(ContatoModel contato) async {
    var url = '/Contato';
    print(contato.toCreateJson());
    await _dioCustom.dio.post(url, data: contato.toCreateJson());
  }

  Future<void> atualizar(ContatoModel contato) async {
    var url = '/Contato/${contato.objectId}';
    await _dioCustom.dio.put(url, data: contato.toCreateJson());
  }

  Future<void> remover(ContatoModel contato) async {
    var url = '/Contato/${contato.objectId}';
    await _dioCustom.dio.delete(url);
  }
}
