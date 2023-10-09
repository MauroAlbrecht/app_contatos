class ContatoModel {
  String? objectId;
  String nome = '';
  String telefone = '';
  String pathFoto = '';

  ContatoModel(
    this.objectId,
    this.nome,
    this.telefone,
    this.pathFoto,
  );

  ContatoModel.vazio();

  ContatoModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    nome = json['nome'];
    telefone = json['telefone'];
    pathFoto = json['path_foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = this.objectId;
    data['telefone'] = this.telefone;
    data['nome'] = this.nome;
    data['path_foto'] = this.pathFoto;

    return data;
  }

  Map<String, dynamic> toCreateJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['telefone'] = this.telefone;
    data['nome'] = this.nome;
    data['path_foto'] = this.pathFoto;

    return data;
  }
}
