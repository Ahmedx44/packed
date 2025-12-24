import 'package:args/args.dart';
import 'package:packed/command/generate_feature_command.dart';
import 'package:packed/command/generate_usecase_command.dart';

class PackedCli {
  void run(List<String> argument) {
    final parser = ArgParser();

    final generate = parser.addCommand('generate');
    generate.addCommand('feature');
    generate.addCommand('usecase');

    final result = parser.parse(argument);

    if (result.command?.name == 'generate') {
      final subCommand = result.command?.command;

      if (subCommand?.name == 'feature') {
        final featureName = subCommand!.arguments.isNotEmpty
            ? subCommand.arguments.first
            : '';

        if (featureName == '') {
          print('❌ Feature name is required');
          return;
        }

        GenerateFeatureCommand().run(featureName);
        return;
      }

      if (subCommand?.name == 'usecase') {
        if (subCommand!.arguments.length < 2) {
          print(
            '❌ Usage: packed generate usecase <usecase_name> <feature_name>',
          );
          return;
        }

        final usecaseName = subCommand.arguments[0];
        final featureName = subCommand.arguments[1];

        GenerateUsecaseCommand().run(usecaseName, featureName);
        return;
      }
    }
  }
}
