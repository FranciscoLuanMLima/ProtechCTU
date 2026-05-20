class Validators {
  Validators._();

  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) return 'Campo obrigatorio.';
    return null;
  }

  static String? year(String? value) {
    final trimmed = value?.trim() ?? '';
    final parsed = int.tryParse(trimmed);
    if (parsed == null) return 'Informe um ano valido.';
    if (parsed < 2000 || parsed > DateTime.now().year) {
      return 'Ano fora do intervalo esperado.';
    }
    return null;
  }
}
