class Conceal {
  String? containerImage;
  String? secret;
  String? output;

  Conceal({
    required this.containerImage,
    required this.secret,
    required this.output,
  });

  @override
  String toString() => 'Conceal{containerImage: $containerImage, secret: $secret, output: $output}';
}
