class Singleton {
  static final Singleton _singleton = Singleton._internal();

  Singleton._internal();

  static Singleton get instance => _singleton;

  var tokenData = '';
  var personCode = '';
  var carrierCode = '';
  var groupNum = '';
  var subscriberNum = '';
  var planInfo = '';
  var dateBirth = '';
}
