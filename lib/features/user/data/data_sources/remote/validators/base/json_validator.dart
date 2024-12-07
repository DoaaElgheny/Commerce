abstract interface class UserJsonValidator {
  const UserJsonValidator();

  bool read(Object json);

  bool toggleNotification(Object json);

  bool update(Object json);

  bool userByToken(Object json);

  bool userToggleOnline(Object json);

  bool validUserDetails(Object json);

  bool validUser(Object json);

  bool verifyAccount(Object json);
}
