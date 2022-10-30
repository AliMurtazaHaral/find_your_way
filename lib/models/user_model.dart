class UserModel {

  String? email;
  String? fullName;
  String? password;
  String? dateOfBorth;
  UserModel(
      {this.dateOfBorth,
        this.email,
        this.fullName,
        this.password,
        });

  // receiving data from server
  factory UserModel.fromMapRegsitration(map) {
    return UserModel(

      email: map['email'],
      fullName: map['fullName'],
      password: map['password'],
      dateOfBorth: map['dateOfBirth'],
    );
  }
  // sending data to our server
  Map<String, dynamic> toMapRegistrationDetails() {
    return {
      'email': email,
      'fullName': fullName,
      'password': password,
      'dateOfBirth': dateOfBorth,
    };
  }

}
