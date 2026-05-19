class Usuario {
  const Usuario({
    required this.nome,
    required this.matricula,
    required this.senha,
    required this.sexo,
    required this.anoEntrada,
  });

  final String nome;
  final String matricula;
  final String senha;
  final String sexo;
  final int anoEntrada;

  // Confere se os dados informados pertencem a este usuario.
  bool validarLogin(String matriculaInformada, String senhaInformada) {
    return matricula == matriculaInformada && senha == senhaInformada;
  }
}
