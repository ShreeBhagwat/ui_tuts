class Student {
  final String name;
  final String email;
  final String phone;
  final String address;

  Student({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }
}
