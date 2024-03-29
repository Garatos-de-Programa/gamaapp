import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

import '/app/auth/domain/errors/errors.dart';
import '../entities/trafficFine/listed_traffic_fine_info.dart';
import '../entities/trafficFine/traffic_fine_info.dart';

abstract class TrafficFineRepository {
  Future<Result<TrafficFineInfo, Failure>> getTrafficFine(int id);

  Future<Result<List<ListedTrafficFineInfo>, Failure>> fetchTrafficFine({
    String? licensePlate,
    String? createdSince,
    String? createdUntil,
    required int size,
    required int pageNumber,
  });

  Future<Result<int, Failure>> createTrafficFine({
    required String licensePlate,
    required double latitude,
    required double longitude,
    required List<Map<String, int>> trafficViolations,
    required String imageUrl,
  });

  Future<Result<String, Failure>> uploadFile(FormData fileFormData);

  // Future<Result<List<int>, Failure>> loadFile(String url);
  Future<Result<List<int>, Failure>> loadFile(String url);
}
