/// A utility class to store all API endpoint URLs as constants.
///
/// Centralizing API URLs in a single class makes them easy to manage
/// and modify without searching through the entire codebase.
class ApiUrl {
  /// The base URL for the API.
  static const String baseUrl = "https://quran-api.santrikoding.com/api";

  // Endpoints related to the home screen
  /// The endpoint for fetching the list of Surahs.
  static const String surah = "$baseUrl/surah/";
}
