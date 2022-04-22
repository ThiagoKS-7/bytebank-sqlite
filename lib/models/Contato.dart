
class Contato {
  final String nome;
  final String numero;


  @override
  String toString() {
    return 'Contato{nome: $nome, numero: $numero}';
  }

  Contato(this.nome, this.numero);
}