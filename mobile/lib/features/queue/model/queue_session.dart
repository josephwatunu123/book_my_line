enum QueueStatus { open, closed }

class QueueSession {
  const QueueSession({
    required this.id,
    required this.name,
    required this.code,
    required this.averageServiceMinutes,
    required this.createdAt,
    required this.status,
  });

  final int id;
  final String name;
  final String code;
  final int averageServiceMinutes;
  final QueueStatus status;
  final DateTime createdAt;

  factory QueueSession.fromJson(Map<String, dynamic> json) {
    return QueueSession(
      id: json["id"] as int,
      name: json["name"] as String,
      code: json["code"] as String,
      averageServiceMinutes: json["averageServiceMinutes"] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: QueueStatus.values.byName(
        (json['status'] as String).toLowerCase(),
      ),
    );
  }
}
