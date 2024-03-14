class DataModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;
  DataModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }


}
