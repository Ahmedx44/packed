import 'package:args/args.dart';
import 'package:packed/command/generate_feature_command.dart';

class PackedCli {
  void run(List<String> argument) {
    final parser = ArgParser();

    final generate = parser.addCommand('generate');
    generate.addCommand('feature');

    final result = parser.parse(argument);

    if (result.command?.name == 'generate' &&
        result.command!.command!.name == 'feature') {
      final featureName = result.command!.command!.arguments.isNotEmpty
          ? result.command!.command!.arguments.first
          : '';

      if (featureName == '') {
        print('❌ Feature name is required');
        return;
      }

      GenerateFeatureCommand().run(featureName);
      return;
    }
  }
}
