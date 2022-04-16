class ErrorHandling {
  String? nameValidation(String? name) {
    if (name == null || name.trim().isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  String? emailValidation(String? email) {
    String pattern = r'\w+@\w+\.\w+';
    if (email == null || email.trim().isEmpty) {
      return 'Field is required';
    } else if (!RegExp(pattern).hasMatch(email)) {
      return 'Invalid Email Address';
    }

    return null;
  }

  String? passwordValidation(String? pass) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$';
    if (pass == null || pass.trim().isEmpty) {
      return 'Field is required';
    } else if (!RegExp(pattern).hasMatch(pass)) {
      return 'Password must be at least 9 characters long ';
    }
    return null;
  }

  String? mobileValidation(String? mobile) {
    String pattern = r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]';
    if (mobile == null || mobile.trim().isEmpty) {
      return 'Field is required';
    } else if (!RegExp(pattern).hasMatch(mobile)) {
      return 'Password must be at least 9 characters long ';
    }
    return null;
  }
}
