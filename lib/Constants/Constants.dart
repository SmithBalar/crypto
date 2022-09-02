const String apiKey = '26002f62ebfaf4acbefaf087113bf6484da76a15';

const String baseUrl = 'https://api.nomics.com/v1/currencies/ticker?key=$apiKey&interval=30d,365d';

String getFileExtension(String url) {
  String fileName = url.split('/').last;
  return fileName.split('.').last;
}
