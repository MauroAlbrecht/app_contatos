import 'contato_model.dart';

class ContatosBack4appModel {
  List<ContatoModel> contatos = [];

  ContatosBack4appModel( this.contatos );

  ContatosBack4appModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      contatos = <ContatoModel>[];
      json['results'].forEach((v) {
        contatos.add(ContatoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.contatos != null) {
      data['results'] = this.contatos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
