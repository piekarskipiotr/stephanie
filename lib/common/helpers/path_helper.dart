import 'package:path/path.dart' as p;

class PathHelper {
  static String getExtensionFromPath(String path) => p.extension(path, 1);

  static String getFileNameFromPath(String path) => p.basename(path);

  static bool isImage(String path) {
    var ext = getExtensionFromPath(path);
    return ext == '.jpg' || ext == '.jpeg' || ext == '.png';
  }
}