typedef DataParser<T> = T Function(Map<String, dynamic> json);
typedef DataEncoder<T> = Map<String, dynamic> Function(T data);

class ResultParserFactory {
  final Map<Type, DataParser> decodersMap = Map();

  T decode<T>(Map<String, dynamic> json) {
    try {
      final decoder = decodersMap[T];
      return decoder(json);
    } on Exception catch (_) {
      print('parsing data error');
      return null;
    }
  }

  void registerDecoder<T>(DataParser<T> decoder) {
    decodersMap[T] = decoder;
  }

  // instance
  static ResultParserFactory _instance = ResultParserFactory();
  static ResultParserFactory get() => _instance;
}
