part of transmission_api;

class GroupSetArgs {
  final List<Arg> _args = [];

  Map<String, dynamic> args(int rpc) => UnmodifiableMapView(
        {
          for (var e in _args.where(
            (element) => rpc >= element.minRpc && rpc < element.maxRpc,
          ))
            e.name: e.value
        },
      );

  GroupSetArgs();

  /// boolean
  /// - true if session upload limits are honored
  GroupSetArgs honorsSessionLimits(bool value) =>
      this.._args.add(Arg.fromValue('honorsSessionLimits', value));

  /// string
  /// - Bandwidth group name
  GroupSetArgs name(String value) =>
      this.._args.add(Arg.fromValue('name', value));

  /// boolean
  /// - true means enabled
  GroupSetArgs speedLimitDownEnabled(bool value) =>
      this.._args.add(Arg.fromValue('speed-limit-down-enabled', value));

  /// number
  /// - max global download speed (KBps)
  GroupSetArgs speedLimitDown(int value) =>
      this.._args.add(Arg.fromValue('speed-limit-down', value));

  /// boolean
  /// - true means enabled
  GroupSetArgs speedLimitUpEnabled(bool value) =>
      this.._args.add(Arg.fromValue('speed-limit-up-enabled', value));

  /// number
  /// - max global upload speed (KBps)
  GroupSetArgs speedLimitUp(int value) =>
      this.._args.add(Arg.fromValue('speed-limit-up', value));
}
