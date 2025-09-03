// class AnalysisModel {
//   final String message;
//   final RecordModel record;

//   AnalysisModel({required this.message, required this.record});

//   factory AnalysisModel.fromJson(Map<String, dynamic> jsonData) {
//     return AnalysisModel(
//       message: jsonData["message"],
//       record: RecordModel.fromJson(jsonData["record"]),
//     );
//   }
// }

// class RecordModel {
//   final int userId;
//   final int? familyMemberId;
//   final String disease;
//   final String diagnosis;
//   final double modelConfidence;
//   final String suggestedDoctor;
//   final String urgency;
//   final String testType;
//   final String analyzedAt;
//   final String updatedAt;
//   final String createdAt;
//   final int id;

//   RecordModel({
//     required this.userId,
//     required this.familyMemberId,
//     required this.disease,
//     required this.diagnosis,
//     required this.modelConfidence,
//     required this.suggestedDoctor,
//     required this.urgency,
//     required this.testType,
//     required this.analyzedAt,
//     required this.updatedAt,
//     required this.createdAt,
//     required this.id,
//   });

//   factory RecordModel.fromJson(Map<String, dynamic> jsonData) {
//     return RecordModel(
//       userId: jsonData["user_id"],
//       familyMemberId: jsonData["family_member_id"],
//       disease: jsonData["disease"],
//       diagnosis: jsonData["diagnosis"],
//       modelConfidence: jsonData["model_confidence"] is int
//           ? (jsonData["model_confidence"] as int).toDouble()
//           : jsonData["model_confidence"],
//       suggestedDoctor: jsonData["suggested_doctor"],
//       urgency: jsonData["urgency"],
//       testType: jsonData["test_type"],
//       analyzedAt: jsonData["analyzed_at"],
//       updatedAt: jsonData["updated_at"],
//       createdAt: jsonData["created_at"],
//       id: jsonData["id"],
//     );
//   }
// }
class AnalysisModel {
  final String message;
  final RecordModel record;

  AnalysisModel({required this.message, required this.record});

  factory AnalysisModel.fromJson(Map<String, dynamic> jsonData) {
    return AnalysisModel(
      message: jsonData["message"] ?? "",
      record: RecordModel.fromJson(jsonData["record"]),
    );
  }
}

class RecordModel {
  final int userId;
  final int? familyMemberId;
  final String disease;
  final String diagnosis;
  final double modelConfidence;
  final String suggestedDoctor;
  final String urgency;
  final String testType;
  final String analyzedAt;
  final String updatedAt;
  final String createdAt;
  final int id;

  RecordModel({
    required this.userId,
    required this.familyMemberId,
    required this.disease,
    required this.diagnosis,
    required this.modelConfidence,
    required this.suggestedDoctor,
    required this.urgency,
    required this.testType,
    required this.analyzedAt,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory RecordModel.fromJson(Map<String, dynamic> jsonData) {
    return RecordModel(
      userId: jsonData["user_id"] is String
          ? int.tryParse(jsonData["user_id"]) ?? 0
          : (jsonData["user_id"] ?? 0),

      familyMemberId: jsonData["family_member_id"] == null
          ? null
          : (jsonData["family_member_id"] is String
                ? int.tryParse(jsonData["family_member_id"])
                : jsonData["family_member_id"]),

      disease: jsonData["disease"] ?? "",
      diagnosis: jsonData["diagnosis"] ?? "",

      modelConfidence: jsonData["model_confidence"] is int
          ? (jsonData["model_confidence"] as int).toDouble()
          : double.tryParse(jsonData["model_confidence"].toString()) ?? 0.0,

      suggestedDoctor: jsonData["suggested_doctor"] ?? "",
      urgency: jsonData["urgency"] ?? "",
      testType: jsonData["test_type"] ?? "",
      analyzedAt: jsonData["analyzed_at"] ?? "",
      updatedAt: jsonData["updated_at"] ?? "",
      createdAt: jsonData["created_at"] ?? "",

      id: jsonData["id"] is String
          ? int.tryParse(jsonData["id"]) ?? 0
          : (jsonData["id"] ?? 0),
    );
  }
}
