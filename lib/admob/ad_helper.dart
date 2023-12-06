import 'dart:io';

class AdHelper {
  static String get bannerAdUnitID1 {
    if (Platform.isAndroid) {
      return '<YOUR TEST CODE>';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get bannerAdUnitID2 {
    if (Platform.isAndroid) {
      return '<YOUR TEST CODE>';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
