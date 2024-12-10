library environment;

class AppEnvironment {
  const AppEnvironment._private({
    required this.baseUrl,
    required this.socketUrl,
    String? baseApi,
    String? storageUrl,
    required this.logEnabled,
  })  : baseApi = baseApi ?? baseUrl,
        storageUrl = storageUrl ?? baseUrl;

  factory AppEnvironment.fromArgs() {
    const env = String.fromEnvironment("env", defaultValue: "development");
    switch (env) {
      case "staging":
        return AppEnvironment.staging;
      case "production":
        return AppEnvironment.production;
      default:
        return AppEnvironment.development;
    }
  }

  final String appStoreLink = "items-apps://itunes.apple.com/app/id";
  final String playStoreLink = "market://details?id=com.azsco.systems";
  final String appStoreUniversalLink = "https://apps.apple.com/us/app/azsco-systems/id";
  final String playStoreUniversalLink = "https://play.google.com/store/apps/details?id=com.azsco.systems";

  final String baseUrl;
  final String baseApi;
  final String socketUrl;
  final String storageUrl;
  final bool logEnabled;

  static const development = AppEnvironment._private(
    baseUrl: "http://192.168.1.6:3000/",
    storageUrl: "http://192.168.1.6:3000/",
    socketUrl: "",
    logEnabled: true,
  );

  static const staging = AppEnvironment._private(
    baseUrl: "https://systems.azsco.com/",
    baseApi: "https://systems.azsco.com/api/",
    socketUrl: "https://systems.azsco.com",
    storageUrl: "https://systems.azsco.com/api/uploads/",
    logEnabled: true,
  );

  static const production = AppEnvironment._private(
    baseUrl: "https://systems.azsco.com/",
    baseApi: "https://systems.azsco.com/api/",
    socketUrl: "https://systems.azsco.com",
    storageUrl: "https://systems.azsco.com/api/uploads/",
    logEnabled: false,
  );
}
