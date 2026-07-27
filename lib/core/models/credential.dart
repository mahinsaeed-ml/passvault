class Credential {
  final String id;
  final String title;
  final String username;
  final String password;
  final String? website;

  const Credential({
    required this.id,
    required this.title,
    required this.username,
    required this.password,
    this.website,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'username': username,
      'password': password,
      'website': website,
    };
  }

  factory Credential.fromJson(Map<String, dynamic> json) {
    return Credential(
      id: json['id'],
      title: json['title'],
      username: json['username'],
      password: json['password'],
      website: json['website'],
    );
  }
}