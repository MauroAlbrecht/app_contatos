class ContatoModel {
  String? objectId;
  String nome = '';
  String telefone = '';
  String imgUrl = '';

  ContatoModel(
    this.objectId,
    this.nome,
    this.telefone,
    this.imgUrl,
  );

  ContatoModel.vazio();

  ContatoModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    nome = json['nome'];
    telefone = json['telefone'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = this.objectId;
    data['telefone'] = this.telefone;
    data['nome'] = this.nome;
    data['imgUrl'] = this.imgUrl;

    return data;
  }

  Map<String, dynamic> toCreateJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['telefone'] = this.telefone;
    data['nome'] = this.nome;
    data['imgUrl'] = this.imgUrl;

    return data;
  }
}
