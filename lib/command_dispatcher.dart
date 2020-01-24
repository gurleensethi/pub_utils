import 'package:pub_utils/commands/package_updator.dart';
import 'package:pub_utils/util_command.dart';

class CommandDispatcher {
  final _COMMANDS = [PackageUpdator()];
  final _COMMANDS_MAP = <String, UtilCommand>{};

  CommandDispatcher() {    
    _COMMANDS.forEach((command) {
      _COMMANDS_MAP[command.commandName] = command;
    });
  }

  void dispatch(List<String> args) {    
    final String command = args[0];
    _COMMANDS_MAP[command].run(args.sublist(1));
  }
}
