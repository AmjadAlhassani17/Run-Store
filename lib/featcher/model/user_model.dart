class UserModel {
  String? userId , name , email , image;

  UserModel({this.userId , this.email , this.name , this.image});

  UserModel.fromJson(Map<dynamic,dynamic>map){
    // ignore: unnecessary_null_comparison
    if(map == null){
      return;
    }
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    image = map['image'];
  }

  toJson(){
    return {
      'userId' : userId,
      'email' : email,
      'name' : name,
      'image' : image,
    };
  }
  
}