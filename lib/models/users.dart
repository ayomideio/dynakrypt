class User{
  final int id;
  final String username;
  final String secretcode;
  final String password;




  const User({
    required this.id,
    required this.username,
    required this.password,
    required this.secretcode
});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password':password,
      'secretcode':secretcode
    };
  }
@override
  String toString(){
    return 'User{id:$id , username:$username}';
}
}