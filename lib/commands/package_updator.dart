import 'dart:io' as io;
import 'package:pub_utils/util_command.dart';
import 'package:yaml/yaml.dart' as yaml;

class PackageUpdator extends UtilCommand {
  @override
  String get commandName => "package_updates";

  @override
  String get simpleDescription =>
      "Checks for updates to packages from pub.dev.";

  @override
  Future<void> run(List<String> args) async {
    final pubspec = io.File('pubspec.yaml');
    if (!pubspec.existsSync()) {
      throw Exception('No pubpsec.yml file found!');
    }

    final yaml.YamlMap map = yaml.loadYaml(pubspec.readAsStringSync());
    final yaml.YamlMap dependencies = map['dependencies'];
    dependencies.forEach((key, value) {
      print(
          "Key: $key(${key.runtimeType}) - Value: $value(${value.runtimeType})");
    });
  }
}
