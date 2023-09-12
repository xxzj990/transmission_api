part of transmission_api;

class Group extends Category<V1> {
  Group(super.v);

  ///## Bandwidth group accessor
  /// - From RPC17(Transmission 4.0.0)
  ///
  /// To know about more
  /// [visit](https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md).
  ///
  ///## Parameters
  ///`group`:
  /// Request arguments: An optional argument group. group is either
  /// a string naming the bandwidth group, or a list of such strings.
  /// If group is omitted, all bandwidth groups are used.
  ///
  ///## Response
  /// | Key | Value type | Description
  /// |:--|:--|:--
  /// |`group`| array | A list of bandwidth group description objects
  ///
  /// A bandwidth group description object has:
  ///
  /// | Key | Value type | Description
  /// |:--|:--|:--
  /// | `honorsSessionLimits` | boolean  | true if session upload limits are honored
  /// | `name` | string | Bandwidth group name
  /// | `speed-limit-down-enabled` | boolean | true means enabled
  /// | `speed-limit-down` | number | max global download speed (KBps)
  /// | `speed-limit-up-enabled` | boolean | true means enabled
  /// | `speed-limit-up` | number | max global upload speed (KBps)
  ///
  Future<Map> groupGet({
    dynamic group,
  }) {
    if (_v.rpc < 17) {
      throw TransmissionException(
        'group-get API from RPC17,but now is ${_v.rpc}',
      );
    }
    return _v._query(
      'group-get',
      arguments: group,
    );
  }

  ///## Bandwidth group mutator
  /// - From RPC17(Transmission 4.0.0)
  ///
  /// To know about more
  /// [visit](https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md).
  ///
  ///## Parameters
  ///`group`:
  /// Request arguments: An optional argument group. group is either
  /// a string naming the bandwidth group, or a list of such strings.
  /// If group is omitted, all bandwidth groups are used.
  ///
  ///## Response
  /// Response arguments: none
  ///
  Future<Map> groupSet({
    required GroupSetArgs args,
  }) {
    if (_v.rpc < 17) {
      throw TransmissionException(
        'group-set API from RPC17,but now is ${_v.rpc}',
      );
    }
    return _v._query(
      'group-set',
      arguments: args.args(_v.rpc),
    );
  }
}
