import 'package:dio/dio.dart' as dio;

import '../../features/murotal/model/detail_surah_model.dart';
import '../../shared/models/surah_model.dart';
import '../constant/api_url.dart';
import '../constant/get_headers.dart';
import '../network/api_result.dart';
import '../network/dio_client.dart';

/// A service class to handle all API calls related to Surah data.
///
/// This class acts as a repository for fetching data from the Surah API,
/// abstracting the network layer from the business logic.
class SurahService {
  // Instance of the Dio client for making HTTP requests.
  final DioClient _dioClient = DioClient();

  /// Fetches the list of all Surahs from the API.
  ///
  /// This method performs a GET request and handles the response.
  /// It returns an `ApiResult` sealed class, which can be either
  /// `ApiSuccess` with a list of `SurahModel` or `ApiError` with an error message.
  Future<ApiResult<List<SurahModel>>> getSurahList() async {
    try {
      // Perform a GET request to the Surah endpoint.
      final dio.Response response = await _dioClient.get(
        ApiUrl.surah,
        options: dio.Options(headers: QSHeaders.basicJson),
      );

      // Extract the data from the response.
      final List<dynamic> data = response.data;

      // Map the dynamic list to a list of SurahModel objects.
      final result = data.map((e) => SurahModel.fromJson(e)).toList();

      // Return a successful result with the list of Surahs.
      return ApiSuccess(result);
    } catch (e) {
      // Catch any errors and return an error result.
      return ApiError(e.toString());
    }
  }

  Future<ApiResult<DetailSurahResponse>> getDetailSurah(int nomor) async {
    try {
      final dio.Response response = await _dioClient.get(
        '${ApiUrl.surah}/$nomor',
        options: dio.Options(headers: QSHeaders.basicJson),
      );

      final data = response.data;
      final result = DetailSurahResponse.fromJson(data);

      // Return a successful result with the list of Surahs.
      return ApiSuccess(result);
    } catch (e) {
      // Catch any errors and return an error result.
      return ApiError(e.toString());
    }
  }
}
