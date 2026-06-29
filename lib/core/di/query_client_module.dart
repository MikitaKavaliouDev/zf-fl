import 'package:injectable/injectable.dart';
import 'package:tanquery_flutter/tanquery_flutter.dart';

/// Registers the tanquery [QueryClient] singleton.
/// Created once and mounted during DI initialization.
@module
abstract class QueryClientModule {
  @singleton
  QueryClient get queryClient => QueryClient()..mount();
}
