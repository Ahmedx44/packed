class Utils {
  static String pascal(String text) {
    if (text.isEmpty) return '';
    return text
        .split(RegExp(r'(_|(?=[A-Z]))'))
        .where((word) => word.isNotEmpty)
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join('');
  }

  static String snake(String text) {
    if (text.isEmpty) return '';
    return text
        .replaceAllMapped(
          RegExp(r'([a-z0-9])([A-Z])'),
          (Match m) => '${m[1]}_${m[2]}',
        )
        .toLowerCase()
        .replaceAll('-', '_');
  }
}
