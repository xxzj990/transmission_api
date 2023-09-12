part of transmission_api;

class System extends Category<V1> {
  System(super.v);

  ///## Blocklist
  /// - From RPC5(Transmission 1.60)
  ///
  /// To know about more
  /// [visit](https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md).
  ///
  ///## Parameters
  /// Request arguments: none
  ///
  ///## Response
  /// Response arguments: a number blocklist-size
  ///
  Future<Map> blocklistUpdate() {
    if (_v.rpc < 5) {
      throw TransmissionException(
        'blocklist-update API from RPC5,but now is ${_v.rpc}',
      );
    }
    return _v._query(
      'blocklist-update',
    );
  }

  ///## Port checking
  /// - From RPC5(Transmission 1.60)
  /// - This method tests to see if your incoming peer port is accessible
  /// from the outside world.
  ///
  /// To know about more
  /// [visit](https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md).
  ///
  ///## Parameters
  /// Request arguments: none
  ///
  ///## Response
  /// Response arguments: a Boolean, port-is-open
  ///
  Future<Map> portTest() {
    if (_v.rpc < 5) {
      throw TransmissionException(
        'port-test API from RPC5,but now is ${_v.rpc}',
      );
    }
    return _v._query(
      'port-test',
    );
  }

  ///## Free space
  /// - From RPC15(Transmission 2.80)
  ///
  /// This method tests how much free space is available in
  /// a client-specified folder.
  ///
  /// To know about more
  /// [visit](https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md).
  ///
  ///## Parameters
  ///`path`:
  /// string
  /// - the directory to query
  ///
  ///## Response
  ///
  /// | Key | Value type | Description
  /// |:--|:--|:--
  /// | `path` | string | same as the Request argument
  /// | `size-bytes` | number | the size, in bytes, of the free space in that directory
  /// | `total_size` | number | the total capacity, in bytes, of that directory From RPC17(Transmission 4.0.0)
  ///
  Future<Map> freeSpace({
    required String path,
  }) {
    if (_v.rpc < 15) {
      throw TransmissionException(
        'free-space API from RPC15,but now is ${_v.rpc}',
      );
    }
    return _v._query(
      'free-space',
      arguments: {
        'path': path,
      },
    );
  }
}
