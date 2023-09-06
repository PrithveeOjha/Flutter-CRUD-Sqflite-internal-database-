
class UserModel{

  final String email;
  final String password;

  UserModel(this.email, this.password);
  Map<String, dynamic> toMap() {
    return{
      'email' : email,
      'password' : password,
    };
  }
}