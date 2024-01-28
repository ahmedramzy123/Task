
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> checkInternet() async {
  globalInternetChecker = await InternetConnectionChecker().hasConnection;
  return globalInternetChecker;
}

bool globalInternetChecker = false;
