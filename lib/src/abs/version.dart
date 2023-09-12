part of transmission_api;

const defaultRpc = 18;

/// Base class of [Version]s
abstract class Version {
  /// Instance of [Transmission]
  final Transmission _tr;

  /// rpc-version
  int rpc = defaultRpc;

  Version(this._tr);
}
