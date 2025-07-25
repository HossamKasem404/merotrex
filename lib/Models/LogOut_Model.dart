class LogOut_Model {
  final List data;
  final String Massage;
  final String satatus;

  LogOut_Model({
    required this.data,
    required this.Massage,
    required this.satatus,
  });

  factory LogOut_Model.fromjson(jsonData) {
    return LogOut_Model(
      data: jsonData["data"],
      Massage: jsonData["Massage"],
      satatus: jsonData["satatus"],
    );
  }
}
