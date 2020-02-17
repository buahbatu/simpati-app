abstract class IConfigRepository {
  Future initConfig({bool isDebug = false});
  T loadConfig<T>(String key);
}
