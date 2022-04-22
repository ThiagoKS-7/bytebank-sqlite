
class Transferencia {
  final double valor;
  final String descricao;


  @override
  String toString() {
    return 'Transferencia{valor: $valor, descricao: $descricao}';
  }

  Transferencia(this.valor, this.descricao);
}