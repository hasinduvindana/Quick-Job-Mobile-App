class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$')
        .hasMatch(value)) {
      return 'Password must include upper, lower, number, and special character';
    }
    return null;
  }

  static String? validateUsername(String? value, String prefix) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    if (!value.startsWith(prefix)) {
      return 'Username must start with "$prefix"';
    }
    return null;
  }
}
