class Users {
  String? email;
  String? password;

  Users(String a, String b) {
    email = a;
    password = b;
  }
}

class Doctors {
  String? email;
  String? password;

  Doctors(String a, String b) {
    email = a;
    password = b;
  }
}

List<Users> usersList = [
  Users('akash@gmail.com', '1234'),
  Users('gokul@gmail.com', '1234'),
  Users('barath@gmail.com', '1234'),
];

List<Doctors> doctorsList = [
  Doctors('abdul@gmail.com', '1234'),
];