import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_file/src/common/open_result.dart';

class OpenFile {
  static const MethodChannel _channel = const MethodChannel('open_file');

  OpenFile._();

  ///linuxDesktopName like 'xdg'/'gnome'
  static Future<OpenResult> open(String? filePath,
      {String? type,
      String? uti,
      String linuxDesktopName = "xdg",
      bool linuxByProcess = false}) async {
    assert(filePath != null);
  

    Map<String, String?> map = {
      "file_path": filePath!,
      "type": type,
      "uti": uti,
    };
    final _result = await _channel.invokeMethod('open_file', map);
    final resultMap = json.decode(_result) as Map<String, dynamic>;
    return OpenResult.fromJson(resultMap);
  }
}
