class Doctors_Model {
  final List<Doctor_Model> data;
  final String message;
  final int status;

  Doctors_Model({
    required this.data,
    required this.message,
    required this.status,
  });

  factory Doctors_Model.fromJson(Map<String, dynamic> json) {
    return Doctors_Model(
      data: List<Doctor_Model>.from(
        json['Data'].map((item) => Doctor_Model.fromJson(item)),
      ),
      message: json['Message'],
      status: json['Status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Data': data.map((e) => e.toJson()).toList(),
      'Message': message,
      'Status': status,
    };
  }
}

class Doctor_Model {
  final int id;
  final String name;
  final String specialty;
  final String phone;
  final String location;
  final String photo;
  final String createdAt;
  final String updatedAt;

  Doctor_Model({
    required this.id,
    required this.name,
    required this.specialty,
    required this.phone,
    required this.location,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Doctor_Model.fromJson(Map<String, dynamic> json) {
    return Doctor_Model(
      id: json['id'],
      name: json['name'],
      specialty: json['specialty'],
      phone: json['phone'],
      location: json['location'],
      photo: json['photo'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialty': specialty,
      'phone': phone,
      'location': location,
      'photo': photo,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
