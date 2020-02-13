typedef DataParser<T> = T Function(Map<String, dynamic> json);
typedef DataEncoder<T> = Map<String, dynamic> Function(T data);

class ResultParserFactory {
  final Map<Type, DataParser> decodersMap = Map();
  final Map<Type, DataEncoder> encoderMap = Map();

  T decode<T>(Map<String, dynamic> json) {
    try {
      final decoder = decodersMap[T];
      return decoder(json);
    } on Exception catch (_) {
      print('parsing data error');
      return null;
    }
  }

  Map<String, dynamic> encode<T>(T data) {
    try {
      final encode = encoderMap[T];
      return encode(data);
    } on Exception catch (_) {
      print('encode data error');
      return null;
    }
  }

  void registerDecoder<T>(DataParser<T> decoder) {
    decodersMap[T] = decoder;
  }

  void registerEncoder<T>(DataEncoder<T> encoder) {
    encoderMap[T] = encoder;
  }

  // instance
  static ResultParserFactory _instance = ResultParserFactory();
  static ResultParserFactory get() => _instance;
}
