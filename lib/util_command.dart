abstract class UtilCommand {
  String get commandName;

  String get simpleDescription;

  Future<void> run(List<String> args);
}
