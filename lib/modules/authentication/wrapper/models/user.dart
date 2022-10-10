class User {
  final String? phone;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? password;

  User({
    this.phone,
    this.email,
    this.firstName,
    this.lastName,
    this.password,
  });

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "password": password,
  };
}
