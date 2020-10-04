import 'package:MoneyTracker/services/navigator_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

void initializeServices() {
  getIt.registerSingleton<NavigatorService>(NavigatorService());
}

NavigatorService get navigator => GetIt.I<NavigatorService>();

