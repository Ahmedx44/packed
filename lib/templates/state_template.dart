import 'package:packed/utils/utils.dart';

class StateTemplate {
  static String stateTemplate(String name) {
    final pascal = Utils.pascal(name);

    return '''
import 'package:equatable/equatable.dart';

class ${pascal}State extends Equatable {
  final bool isLoading;
  final String? error;

  const ${pascal}State({
    this.isLoading = false,
    this.error,
  });

  ${pascal}State copyWith({
    bool? isLoading,
    String? error,
  }) {
    return ${pascal}State(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, error];
}
''';
  }
}
