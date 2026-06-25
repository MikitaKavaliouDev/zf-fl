import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../events/event_bus.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void initDependencies() {
  getIt.init();
  getIt.registerSingleton<EventBus>(EventBus());
}
