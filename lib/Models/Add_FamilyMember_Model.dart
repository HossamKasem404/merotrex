class FamilyMember_Models {
  final List<FamilyMember_Model> data;
  final String message;
  final int status;

  FamilyMember_Models({
    required this.data,
    required this.message,
    required this.status,
  });

  factory FamilyMember_Models.fromJson(Map<String, dynamic> json) {
    return FamilyMember_Models(
      data: List<FamilyMember_Model>.from(
        json['data'].map((item) => FamilyMember_Model.fromJson(item)),
      ),
      message: json['Message'],
      status: json['Status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'Message': message,
      'Status': status,
    };
  }
}

class FamilyMember_Model {
  final int id;
  final int userId;
  final String fullName;
  final String dateOfBirth;
  final int gender;
  final String relation;
  final String? photo;
  final String createdAt;
  final String updatedAt;

  FamilyMember_Model({
    required this.id,
    required this.userId,
    required this.fullName,
    required this.dateOfBirth,
    required this.gender,
    required this.relation,
    this.photo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FamilyMember_Model.fromJson(Map<String, dynamic> json) {
    return FamilyMember_Model(
      id: json['id'],
      userId: json['user_id'],
      fullName: json['full_name'],
      dateOfBirth: json['date_of_birth'],
      gender: json['gender'],
      relation: json['relation'],
      photo: json['photo'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'full_name': fullName,
      'date_of_birth': dateOfBirth,
      'gender': gender,
      'relation': relation,
      'photo': photo,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
