class UserData
{
  String name;
  String email;
  String password;
  String conformPass;

  UserData({
    required this.name,
    required this.email,
    required this.password,
    required this.conformPass,
  });

  Map<String,dynamic> toJson()
  {
    return
      {
        'username' : name,
        'email' : email,
        'password' : password,
        'password_confirm' : conformPass,
      };
  }
}