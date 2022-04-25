
class Contato {
  final int? id;
  final String nome;
  final int numero;

  // construtor
  Contato(this.id,this.nome, this.numero);

  @override
  String toString() {
    return 'Contato{id: $id, nome: $nome, numero: $numero}';
  }

}