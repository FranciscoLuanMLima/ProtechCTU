class Formatters {
  Formatters._();

  static String compactName(String value) {
    final parts = value.trim().split(RegExp(r'\s+'));
    if (parts.length <= 1) return value.trim();
    return '${parts.first} ${parts.last}';
  }
}
