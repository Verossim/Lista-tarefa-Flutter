class Tarefa {

  //atributos da classe
  String nome;
  DateTime data;
  bool concluida;

  //construtor
  Tarefa(String nome) {
    this.nome = nome;
    data = DateTime.now();
    concluida = false;
  }
}