import 'dart:io';

class AdHelper {
  static String get bannerAdUnitID1 {
    if (Platform.isAndroid) {
      return '<YOUR TEST CODE>';
    } else if (Platform.isIOS) {
      return '<YOUR TEST CODE>';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get bannerAdUnitID2 {
    if (Platform.isAndroid) {
      return '<YOUR TEST CODE>';
    } else if (Platform.isIOS) {
      return '<YOUR TEST CODE>';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
