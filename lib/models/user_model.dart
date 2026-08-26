class AppUser {
  final String uid;
  final String username;
  final String email;

  AppUser({
    required this.uid,
    required this.username,
    required this.email,
  });


  Map<String, dynamic> toMap() => {
    'username': username,
    'email': email,
  };

  factory AppUser.fromMap(String uid, Map<String, dynamic> map) => AppUser(
    uid: uid,
    username: map['username'] ?? '',
    email: map['email'] ?? '',
  );
}