class SignUp_Model {
  final String message;
  final DataMoldel Data;
  final int status;

  SignUp_Model({
    required this.message,
    required this.Data,
    required this.status,
  });
  factory SignUp_Model.fromJson(jsonData) {
    return SignUp_Model(
      message: jsonData["message"],
      Data: DataMoldel.fromJson(jsonData["Data"]),
      status: jsonData["status"],
    );
  }
}

class DataMoldel {
  final UserModel user;
  final String token;
  DataMoldel({required this.user, required this.token});
  factory DataMoldel.fromJson(jsonData) {
    return DataMoldel(
      user: UserModel.fromjson(jsonData["user"]),
      token: jsonData["token"],
    );
  }
}

class UserModel {
  final String first_name;
  final String last_name;
  final String photo;
  final String gender;
  final String email;
  final String date_of_birth;
  final String updated_at;
  final String created_at;
  final int id;
  final String age;

  UserModel({
    required this.first_name,
    required this.last_name,
    required this.photo,
    required this.gender,
    required this.email,
    required this.date_of_birth,
    required this.updated_at,
    required this.created_at,
    required this.id,
    required this.age,
  });
  factory UserModel.fromjson(jsonData) {
    return UserModel(
      first_name: jsonData["first_name"],
      last_name: jsonData["last_name"],
      photo: jsonData["photo"],
      gender: jsonData["gender"].toString(),
      email: jsonData["email"],
      date_of_birth: jsonData["date_of_birth"],
      updated_at: jsonData['updated_at'],
      created_at: jsonData['created_at'],
      id: jsonData["id"],
      age: jsonData["age"].toString(),
    );
  }

  String get genderLabel {
    switch (gender) {
      case "0":
        return "Male";
      case "1":
        return "Female";
      default:
        return "غير محدد";
    }
  }
}
