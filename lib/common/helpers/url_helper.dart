import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  static void openEmail(String email) async {
    String url = "mailto:$email";
    await canLaunch(url) ? await launch(url) : throw 'Error during launching email';
  }

  static void openUrl(String address) async {
    await canLaunch(address) ? await launch(address) : throw 'Error during launching website';
  }
}