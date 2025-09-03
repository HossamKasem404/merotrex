class Pharmacies_Model {
  final List<Pharmacy_Model> data;
  final String message;
  final int status;

  Pharmacies_Model({
    required this.data,
    required this.message,
    required this.status,
  });

  factory Pharmacies_Model.fromJson(Map<String, dynamic> json) {
    return Pharmacies_Model(
      data: List<Pharmacy_Model>.from(
        json['Data'].map((item) => Pharmacy_Model.fromJson(item)),
      ),
      message: json['Message'] ?? "",
      status: json['Status'] ?? 0,
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

class Pharmacy_Model {
  final int id;
  final String name;
  final String pharmacistName;
  final String phone;
  final String location;
  final String workingHours;
  final String createdAt;
  final String updatedAt;

  Pharmacy_Model({
    required this.id,
    required this.name,
    required this.pharmacistName,
    required this.phone,
    required this.location,
    required this.workingHours,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Pharmacy_Model.fromJson(Map<String, dynamic> json) {
    return Pharmacy_Model(
      id: json['id'],
      name: json['name'],
      pharmacistName: json['pharmacist_name'],
      phone: json['phone'],
      location: json['location'],
      workingHours: json['working_hours'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'pharmacist_name': pharmacistName,
      'phone': phone,
      'location': location,
      'working_hours': workingHours,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
