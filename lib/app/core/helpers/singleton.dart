class Singleton {
  static final Singleton _singleton = Singleton._internal();

  Singleton._internal();

  static Singleton get instance => _singleton;

  var drugSearchOrderBy = '';
  var useZipCode = false;
  var latitude = 0.0;
  var longitude = 0.0;
}
