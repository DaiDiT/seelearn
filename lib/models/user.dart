class User {
  final int? userId;
  final String? name;
  final String? school;
  final String email;
  final String password;
  final String? role;

  User({
    this.userId,
    this.name,
    this.school,
    required this.email,
    required this.password,
    this.role,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        name: json["name"],
        school: json["school"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "name": name,
        "school": school,
        "email": email,
        "password": password,
        "role": role,
      };
}
