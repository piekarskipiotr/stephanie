import 'dart:io';

class FileHelper {
  static String getSizeOfFileMB(String path) {
    var file = File(path);
    final bytes = file.readAsBytesSync().lengthInBytes;
    final kb = bytes / 1024;
    final mb = kb / 1024;

    return '${mb.toStringAsFixed(2)} MB';
  }
}