class EmployeeModel {
  final String name;
  final String phoneNumber;
  final String location;
  final String skill;
  final String experience;
  final String username;
  final String email;

  EmployeeModel({
    required this.name,
    required this.phoneNumber,
    required this.location,
    required this.skill,
    required this.experience,
    required this.username,
    required this.email,
  });

  // Convert to Map (for Firebase)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'location': location,
      'skill': skill,
      'experience': experience,
      'username': username,
      'email': email,
    };
  }

  // Convert from Map (from Firebase)
  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      location: map['location'],
      skill: map['skill'],
      experience: map['experience'],
      username: map['username'],
      email: map['email'],
    );
  }
}
