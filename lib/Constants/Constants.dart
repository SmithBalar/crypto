const String apiKey = '';

const String baseUrl = 'https://api.simpleswap.io/get_all_currencies?api_key=$apiKey';

String getFileExtension(String url) {
  String fileName = url.split('/').last;
  return fileName.split('.').last;
}
