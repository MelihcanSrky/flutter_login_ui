String? validatePassword(String? value) {
  if (value!.isEmpty) {
    return "Şifre alanı boş bırakılamaz";
  } else if (value.length < 6) {
    return "Şifre en az 6 karakter olmalıdır";
  } else {
    return null;
  }
}

String? validateUserName(String? value) {
  if (value!.isEmpty) {
    return "Kullanıcı adı boş bırakılamaz";
  } else if (value.length < 3) {
    return "Kullanıcı adı en az 3 karakter olmalıdır";
  } else {
    return null;
  }
}
