import '../models/usuario.dart';

class AuthService {
  AuthService._();

  // Simula uma base de usuarios em memoria durante a execucao do app.
  static final List<Usuario> usuarios = [];

  // Guarda a sessao atual apos um login bem-sucedido.
  static Usuario? usuarioAtual;

  static bool matriculaJaCadastrada(String matricula) {
    return usuarios.any((usuario) => usuario.matricula == matricula);
  }

  static void cadastrarUsuario(Usuario usuario) {
    usuarios.add(usuario);
  }

  static Usuario? fazerLogin(String matricula, String senha) {
    for (final usuario in usuarios) {
      if (usuario.validarLogin(matricula, senha)) {
        usuarioAtual = usuario;
        return usuario;
      }
    }

    return null;
  }

  static void sair() {
    usuarioAtual = null;
  }
}
