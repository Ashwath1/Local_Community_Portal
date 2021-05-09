class menuData {
  static String fullName;
  static String em;
  menuData({String name, String email}) {
    fullName = name;
    em = email;
  }

  static final getData = [
    {
      'name': fullName,
      'email': em,
    },
  ];
}
