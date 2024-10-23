class UserResponseModel {
  List<Users>? users;

  UserResponseModel({this.users});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
  }

}

class Users {
  String? contactNumber;
  String? location;
  String? name;
  String? profileImage;

  Users({this.contactNumber, this.location, this.name, this.profileImage});

  Users.fromJson(Map<String, dynamic> json) {
    contactNumber = json['contactNumber'];
    location = json['location'];
    name = json['name'];
    profileImage = json['profileImage'];
  }

}
