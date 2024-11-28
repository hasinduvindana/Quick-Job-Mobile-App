class PublisherModel {
  final String name;
  final String phoneNumber;
  final String username;
  final String email;

  PublisherModel({
    required this.name,
    required this.phoneNumber,
    required this.username,
    required this.email,
  });

  // Convert to Map (for Firebase)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'username': username,
      'email': email,
    };
  }

  // Convert from Map (from Firebase)
  factory PublisherModel.fromMap(Map<String, dynamic> map) {
    return PublisherModel(
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      username: map['username'],
      email: map['email'],
    );
  }
}

