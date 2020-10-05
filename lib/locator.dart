import 'package:MoneyTracker/services/http_service.dart';
import 'package:MoneyTracker/services/navigator_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

void initializeServices() {
  getIt.registerSingleton<NavigatorService>(NavigatorService());
  getIt.registerSingleton<HttpService>(HttpService());
}

NavigatorService get navigator => GetIt.I<NavigatorService>();
HttpService get httpService => GetIt.I<HttpService>();
