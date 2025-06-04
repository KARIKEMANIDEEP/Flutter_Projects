class User{
  String name;
  String email;
  int age;
  bool isLoggedIn;

  User({
    required this.name,
    required this.email,
    required this.age,
    required this.isLoggedIn
});
}
User?currentUser;