/// Dual-mode app: client (default) or trainer role.
enum AppMode {
  client,
  trainer;

  bool get isTrainer => this == AppMode.trainer;
  bool get isClient => this == AppMode.client;

  /// Key prefix for per-mode token/user storage.
  String get storagePrefix => '${name}_';
}
