import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/queue_info/model/queue_session.dart';
import 'package:mobile/network/api_exception.dart';
import 'package:mobile/network/dio_exception_mapper.dart';
import 'package:mobile/network/dio_provider.dart';

class HomeRepository {
  final Dio dio;
  HomeRepository(this.dio);

  Future<QueueSession> getQueue(String code) async {
    try {
      final response = await dio.get(code);
      final data = Map<String, dynamic>.from(response.data as Map);
      return QueueSession.fromJson(data);
    } on DioException catch (error) {
      throw mapDioException(error);
    } catch (error) {
      throw ApiException(
        type: ApiExceptionType.invalidResponse,
        message: 'The server returned an invalid queue response.',
        cause: error,
      );
    }
  }
}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final dio = ref.read(dioProvider);
  return HomeRepository(dio);
});
