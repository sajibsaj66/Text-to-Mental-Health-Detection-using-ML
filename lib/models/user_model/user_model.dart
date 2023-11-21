// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? name;
  String? address;
  String? image;
  String? contact;
  String? occupation;

  UserModel({
    this.name,
    this.address,
    this.image,
    this.contact,
    this.occupation,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['home_address'];
    occupation = json['occupation'];
    contact = json['contact'];
    image = json['image'];
  }
}
