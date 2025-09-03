// class Famely_Members_Records_Model {
//   final List<Family_Member_Analysis_Model> data;
//   final String Message;
//   final int Status;

//   Famely_Members_Records_Model({
//     required this.data,
//     required this.Message,
//     required this.Status,
//   });

//   factory Famely_Members_Records_Model.fromJson(Map<String, dynamic> json) {
//     return Famely_Members_Records_Model(
//       data: List<Family_Member_Analysis_Model>.from(
//         json['data'].map((item) => Family_Member_Analysis_Model.fromJson(item)),
//       ),
//       Message: json['Message'],
//       Status: json['Status'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'data': data.map((e) => e.toJson()).toList(),
//       'Message': Message,
//       'Status': Status,
//     };
//   }
// }

// class Family_Member_Analysis_Model {
//   final int id;
//   final int user_id;
//   final int family_member_id;
//   final String disease;
//   final String diagnosis;
//   final double model_confidence;
//   final String test_type;
//   final String suggested_doctor;
//   final String urgency;
//   final String analyzed_at;

//   Family_Member_Analysis_Model({
//     required this.id,
//     required this.user_id,
//     required this.family_member_id,
//     required this.disease,
//     required this.diagnosis,
//     required this.model_confidence,
//     required this.test_type,
//     required this.suggested_doctor,
//     required this.urgency,
//     required this.analyzed_at,
//   });

//   factory Family_Member_Analysis_Model.fromJson(Map<String, dynamic> json) {
//     return Family_Member_Analysis_Model(
//       id: json['id'],
//       user_id: json['user_id'],
//       family_member_id: json['family_member_id'],
//       disease: json['disease'],
//       diagnosis: json['diagnosis'],
//       model_confidence: (json['model_confidence'] as num).toDouble(),
//       test_type: json['test_type'],
//       suggested_doctor: json['suggested_doctor'],
//       urgency: json['urgency'],
//       analyzed_at: json['analyzed_at'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'user_id': user_id,
//       'family_member_id': family_member_id,
//       'disease': disease,
//       'diagnosis': diagnosis,
//       'model_confidence': model_confidence,
//       'test_type': test_type,
//       'suggested_doctor': suggested_doctor,
//       'urgency': urgency,
//       'analyzed_at': analyzed_at,
//     };
//   }
// }
class Famely_Members_Records_Model {
  final List<Family_Member_Analysis_Model> data;
  final String Message;
  final int Status;

  Famely_Members_Records_Model({
    required this.data,
    required this.Message,
    required this.Status,
  });

  factory Famely_Members_Records_Model.fromJson(Map<String, dynamic> json) {
    return Famely_Members_Records_Model(
      data: json['data'] != null
          ? List<Family_Member_Analysis_Model>.from(
              json['data'].map(
                (item) => Family_Member_Analysis_Model.fromJson(item),
              ),
            )
          : [],
      Message: json['Message'] ?? "",
      Status: json['Status'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'Message': Message,
      'Status': Status,
    };
  }
}

class Family_Member_Analysis_Model {
  final int id;
  final int user_id;
  final int family_member_id;
  final String disease;
  final String diagnosis;
  final double model_confidence;
  final String test_type;
  final String suggested_doctor;
  final String urgency;
  final String analyzed_at;

  Family_Member_Analysis_Model({
    required this.id,
    required this.user_id,
    required this.family_member_id,
    required this.disease,
    required this.diagnosis,
    required this.model_confidence,
    required this.test_type,
    required this.suggested_doctor,
    required this.urgency,
    required this.analyzed_at,
  });

  factory Family_Member_Analysis_Model.fromJson(Map<String, dynamic> json) {
    return Family_Member_Analysis_Model(
      id: json['id'] ?? 0,
      user_id: json['user_id'] ?? 0,
      family_member_id: json['family_member_id'] ?? 0,
      disease: json['disease'] ?? "",
      diagnosis: json['diagnosis'] ?? "",
      model_confidence: (json['model_confidence'] ?? 0).toDouble(),
      test_type: json['test_type'] ?? "",
      suggested_doctor: json['suggested_doctor'] ?? "",
      urgency: json['urgency'] ?? "",
      analyzed_at: json['analyzed_at'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': user_id,
      'family_member_id': family_member_id,
      'disease': disease,
      'diagnosis': diagnosis,
      'model_confidence': model_confidence,
      'test_type': test_type,
      'suggested_doctor': suggested_doctor,
      'urgency': urgency,
      'analyzed_at': analyzed_at,
    };
  }
}
