/// Defines base endpoints for connection to server.
class ServerAddress {
  ///  Base address for connection.
  final String _address = "http://92.255.108.56:8000/api";

  /// Base address for images.
  final String _imageAddress = "http://92.255.108.56:8000";

  /// Api version.
  final String _apiVer = "v1";

  String get relevant => "$_address/$_apiVer/";
  String get imageAddress => _imageAddress;
}
