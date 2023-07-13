class User
{
  int user_id;
  String user_name;
  String user_email;
  String user_password;

  User
  (
      this.user_id,
      this.user_name,
      this.user_email,
      this.user_password, 
  );

  factory User.fromJson(Map<String, dynamic> json) =>User(
    int.parse(json['id']) ,
    json['fullname'],
    json['email'],
    json['password'],
  );


  Map<String, dynamic> toJson() =>
  {
    'id': user_id.toString(),
    'fullname': user_name,
    'email': user_email,
    'password': user_password,
  };
  
  
}