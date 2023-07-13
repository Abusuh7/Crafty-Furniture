class MyPws
{
  int user_id;
  // String user_name;
  // String user_email;
  String user_password;
  String new_password;

  MyPws(
     this.user_id,
    //  this.user_name,
    //  this.user_email,
     this.user_password,
     this.new_password,
  );

  factory MyPws.fromJson(Map<String, dynamic> json) =>MyPws(
    int.parse(json['id']) ,
    // json['fullname'],
    // json['email'],
    json['password'],
    json['newpassword']
  );


  Map<String, dynamic> toJson() =>
  {
    'id': user_id.toString(),
    // 'fullname': user_name,
    // 'email': user_email,
    'password': user_password,
    'newpassword': new_password,
  };
}