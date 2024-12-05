class Validation {
  static const String validEmail =
      r"^[0-9]{9}|[a-zA-Z0-9_\-\.]+@[a-zA-Z0-9_\-\.]+\.[a-zA-Z]{2,5}";
  static const String validPassword =
      r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*#?&^_-]).{8,}";
}
