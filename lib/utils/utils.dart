import 'dart:io';

/// A utility class containing helper methods for string manipulation and file operations.
class Utils {
  /// Converts a string to PascalCase.
  static String pascal(String text) {
    if (text.isEmpty) return '';
    return text
        .split(RegExp(r'(_|(?=[A-Z]))'))
        .where((word) => word.isNotEmpty)
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join('');
  }

  /// Creates a directory at the given [path] if it doesn't exist.
  static void createDir(String path) {
    final dir = Directory(path);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
  }

  /// Creates a file at the given [path] with the provided [content].
  static void createFile(String path, String content) {
    final file = File(path);
    file.writeAsStringSync(content);
  }

  /// Converts a string to snake_case.
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

  /// Updates the Dependency Injection (DI) file at [diPath] to register a new usecase.
  static void updateDi(String diPath, String name, String feature) {
    final file = File(diPath);
    if (!file.existsSync()) {
      print('DI file not found at $diPath. Skipping DI registration.');
      return;
    }

    final content = file.readAsStringSync();
    final pascal = Utils.pascal(name);

    // Add import
    final importLine = "import '../domain/usecases/${name}_usecase.dart';\n";
    if (content.contains(importLine)) return;

    // Find the last import and insert after it
    final lastImportIndex = content.lastIndexOf('import ');
    final endOfImports = content.indexOf('\n', lastImportIndex) + 1;

    var newContent =
        content.substring(0, endOfImports) +
        importLine +
        content.substring(endOfImports);

    // Add registration
    final registrationLine =
        "  sl.registerLazySingleton(() => ${pascal}UseCase(sl()));\n";
    if (newContent.contains(registrationLine)) return;

    // Find // Usecases or // Repository and insert before/after
    if (newContent.contains('// Usecases')) {
      newContent = newContent.replaceFirst(
        '// Usecases',
        '// Usecases\n$registrationLine',
      );
    } else {
      // Fallback: insert before the last closing brace
      final lastBrace = newContent.lastIndexOf('}');
      newContent =
          newContent.substring(0, lastBrace) +
          registrationLine +
          newContent.substring(lastBrace);
    }

    file.writeAsStringSync(newContent);
  }

  /// Adds necessary Flutter dependencies to the project using 'flutter pub add'.
  static void addDependencies() {
    if (!File('pubspec.yaml').existsSync()) return;

    print('📦 Adding dependencies...');
    Process.runSync('flutter', [
      'pub',
      'add',
      'flutter_bloc',
      'get_it',
      'equatable',
      'dartz',
      'internet_connection_checker',
    ]);
  }

  /// Checks if the project is initialized with core layers.
  static bool isInitialized() {
    return Directory('lib/core').existsSync() &&
        File('lib/injection_container.dart').existsSync();
  }
}
