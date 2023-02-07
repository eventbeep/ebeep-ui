import 'dart:convert';
import 'dart:io';

/// Run this file only when FVM has been installed on your machine.
/// You only need to run it once after cloning this repo
main() {
  final file = File('.fvm/fvm_config.json');
  final jsonObject = json.decode(file.readAsStringSync());
  final version = jsonObject['flutterSdkVersion'];

  executeCommand('rm', ['.fvm/flutter_sdk']);
  executeCommand('fvm', ['version']);
  executeCommand('fvm', ['install', version]);

  // if (version == 'stable' || version == 'beta' || version == 'dev' || version == 'master') {
  //   executeCommand('fvm', ['flutter', 'upgrade', version]);
  // }
  executeCommand('fvm', ['use', version]);
  executeCommand('fvm', ['flutter', 'doctor', '-v']);
}

void executeCommand(String cmd, List<String> params) {
  final fullCommand = '$cmd ${params.join(' ')}';
  try {
    printMessage('\nExecuting command:\n$fullCommand');
    final result = Process.runSync(cmd, params);
    final output = result.stdout;
    if (output.toString().isNotEmpty) {
      printMessage('$output');
    }
  } catch (e) {
    printMessage('\nFailed to execute command: $fullCommand\n$e');
    exit(-1);
  }
}

void printMessage(Object message) {
  // ignore: avoid_print
  print(message);
}
