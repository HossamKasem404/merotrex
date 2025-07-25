class Add_FamilyMember_Model {
  final String message;
  final int status;
  final FamilyDataModel data;

  Add_FamilyMember_Model({
    required this.message,
    required this.status,
    required this.data,
  });

  factory Add_FamilyMember_Model.fromJson(Map<String, dynamic> json) {
    return Add_FamilyMember_Model(
      message: json["Message"],
      status: json["Status"],
      data: FamilyDataModel.fromJson(json["Data"]),
    );
  }
}

class FamilyDataModel {
  final FamilyMemberModel familyMember;

  FamilyDataModel({required this.familyMember});

  factory FamilyDataModel.fromJson(Map<String, dynamic> json) {
    return FamilyDataModel(
      familyMember: FamilyMemberModel.fromJson(json["FamilyMember"]),
    );
  }

  get data => null;
}

class FamilyMemberModel {
  final int userId;
  final String fullName;
  final String dateOfBirth;
  final int gender;
  final String relation;
  final String? photo;
  final String updatedAt;
  final String createdAt;
  final int id;
  final int age;

  FamilyMemberModel({
    required this.userId,
    required this.fullName,
    required this.dateOfBirth,
    required this.gender,
    required this.relation,
    this.photo,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.age,
  });

  factory FamilyMemberModel.fromJson(Map<String, dynamic> json) {
    return FamilyMemberModel(
      userId: json["user_id"],
      fullName: json["full_name"],
      dateOfBirth: json["date_of_birth"],
      gender: json["gender"],
      relation: json["relation"],
      photo: json["photo"],
      updatedAt: json["updated_at"],
      createdAt: json["created_at"],
      id: json["id"],
      age: json["age"],
    );
  }
}
