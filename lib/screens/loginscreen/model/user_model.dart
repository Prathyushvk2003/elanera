class UserModel {
  final int id;
  final String username;
  final String password;
  final String firstname;

  UserModel({
    required this.id,
    required this.username,
    required this.password,
    required this.firstname,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      firstname: json['name']['firstname'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "password": password,
      "name": {
        "firstname": firstname,
        "lastname": "", // Optional but valid
      },
      "email": "", // Optional; remove if not needed
    };
  }
}
