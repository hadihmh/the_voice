import 'package:flutter/foundation.dart';
import 'package:the_voice/base_classes/custom_flutter_error.dart';

void recordFlutterError(FlutterErrorDetails error) async {
  var errorToSendServer = CustomFlutterError(
      time: DateTime.now().millisecondsSinceEpoch ~/ 1000,
      error: error.exception.toString(),
      stacktrace: error.stack.toString());
// FlutterErrorReportBLoC().saveErrorInDb(errorToSendServer);
}
