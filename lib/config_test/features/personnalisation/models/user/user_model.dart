import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mombien_test/config_test/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  //Constructeur
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  //Helper functions
  String get fullName => '$firstName $lastName';

  //Helper functions
  String get formattedPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  //Static function to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split(' ');

  //Static function to generate username from first and last name
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername =
        "$firstName $lastName"; // Combine first and last name
    String usernameWithPrefix = "Mb_$camelCaseUsername"; // Add "cwt_" prefix
    return usernameWithPrefix;
  }

  //Static function to create a empty UserModel
  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        username: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
      );

  /// Convert model to JSON
  Map<String, dynamic> toJson() => {
        'FirstName': firstName,
        'LastName': lastName,
        'Username': username,
        'Email': email,
        'PhoneNumber': phoneNumber,
        'ProfilePicture': profilePicture,
      };

  /// Factory method to create a UserModel from a FireBase document
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        username: data['Username'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
