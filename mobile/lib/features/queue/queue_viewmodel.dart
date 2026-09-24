import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/queue/model/queue_session.dart';
import 'package:mobile/network/dio_provider.dart';

class QueueViewmodel extends AsyncNotifier<List<QueueSession>> {
  Dio get dio => ref.read(dioProvider);
  @override
  FutureOr<List<QueueSession>> build() async {
    return getAllQueues();
  }

  Future<List<QueueSession>> getAllQueues() async {
    final response = await dio.get("/queue");
    return (response.data as List)
        .map((json) => QueueSession.fromJson(json))
        .toList();
  }
}
