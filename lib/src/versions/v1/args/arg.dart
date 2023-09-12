part of transmission_api;

class Arg {
  /// Min Rpc version
  final int minRpc;

  /// Max Rpc version
  final int maxRpc;

  final String name;

  final dynamic value;

  Arg._(
    this.name, {
    required this.minRpc,
    required this.maxRpc,
    this.value,
  });

  factory Arg.fromName(
    String name, {
    int? minRpc,
    int? maxRpc,
  }) =>
      Arg._(name, minRpc: minRpc ?? 1, maxRpc: maxRpc ?? 9999);

  factory Arg.fromValue(
    String name,
    dynamic value, {
    int? minRpc,
    int? maxRpc,
  }) =>
      Arg._(name, value: value, minRpc: minRpc ?? 1, maxRpc: maxRpc ?? 9999);
}
