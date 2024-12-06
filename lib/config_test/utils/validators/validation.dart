/// VALIDATION CLASS
class TValidator {
  /// Empty Text Validation
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.';
    }

    return null;
  }

  /// Username Validation
  static String? validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'Username is required.';
    }

    // Define a regular expression pattern for the username.
    const pattern = r"^[a-zA-Z0-9_-]{3,20}$";

    // Create a RegExp instance from the pattern.
    final regex = RegExp(pattern);

    // Use the hasMatch method to check if the username matches the pattern.
    bool isValid = regex.hasMatch(username);

    // Check if the username doesn't start or end with an underscore or hyphen.
    if (isValid) {
      isValid = !username.startsWith('_') &&
          !username.startsWith('-') &&
          !username.endsWith('_') &&
          !username.endsWith('-');
    }

    if (!isValid) {
      return 'Username is not valid.';
    }

    return null;
  }

  /// Email Validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }

    return null;
  }

  /// Password Validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.';
    }

    return null;
  }

  /// Phone Number Validation
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    // Regular expression for phone number validation (assuming a 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{11}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (12 digits required).';
    }

    return null;
  }

  /// Title Validation
  static String? validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Title is required.';
    }
    if (value.length < 3) {
      return 'Title must be at least 3 characters long.';
    }
    return null;
  }

  /// Description Validation
  static String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Description is required.';
    }
    if (value.length < 10) {
      return 'Description must be at least 10 characters long.';
    }
    return null;
  }

  /// Price Validation
  static String? validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Price is required.';
    }
    final price = double.tryParse(value);
    if (price == null || price <= 0) {
      return 'Enter a valid price greater than 0.';
    }
    return null;
  }

  /// Surface Area Validation
  static String? validateSurfaceArea(String? value) {
    if (value == null || value.isEmpty) {
      return 'Surface area is required.';
    }
    final area = double.tryParse(value);
    if (area == null || area <= 0) {
      return 'Enter a valid surface area greater than 0.';
    }
    return null;
  }

  /// Room Count Validation
  static String? validateRoomCount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Room count is required.';
    }
    final rooms = int.tryParse(value);
    if (rooms == null || rooms < 1) {
      return 'Enter a valid number of rooms (at least 1).';
    }
    return null;
  }

  /// Location Validation (e.g., City/Address)
  static String? validateLocation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Location is required.';
    }
    if (value.length < 3) {
      return 'Location must be at least 3 characters long.';
    }
    return null;
  }

  /// Year of Construction Validation
  static String? validateYear(String? value) {
    if (value == null || value.isEmpty) {
      return 'Year of construction is required.';
    }
    final year = int.tryParse(value);
    if (year == null || year < 1800 || year > DateTime.now().year) {
      return 'Enter a valid year between 1800 and ${DateTime.now().year}.';
    }
    return null;
  }

// Add more custom validators as needed for your specific requirements.
}
