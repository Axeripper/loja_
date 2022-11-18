bool isNullOrEmpty(String str) {
  // ignore: prefer_is_empty
  if (str.isEmpty || str == null || str.length == 0) {
    return true;
  } else {
    return false;
  }
}
