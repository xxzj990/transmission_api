part of transmission_api;

class Session extends Category<V1> {
  Session(super.v);

  ///## Accessors
  ///
  /// To know about more
  /// [visit](https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md).
  ///
  ///## Parameters
  ///`fields`:
  /// - From RPC16(Transmission 3.00)
  /// - Request arguments: an optional fields array of keys (see 4.1)
  ///
  ///## Response
  /// Response arguments: key/value pairs matching the request's
  /// fields argument if present, or all supported fields (see 4.1) otherwise.
  ///
  ///# Note
  /// From RPC13(Transmission 2.30) new arg isUTP to the peers list
  ///
  Future<Map> sessionGet({
    required SessionArgs fields,
  }) {
    final fs = fields.argsGet(_v.rpc);
    if (_v.rpc >= 16 && fs.isEmpty) {
      throw const TransmissionException('A required args empty.');
    }
    return _v._query(
      'session-get',
      arguments: {
        if (_v.rpc >= 16) 'fields': fs,
      },
    );
  }

  ///## Mutators
  ///
  /// To know about more
  /// [visit](https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md).
  ///
  ///## Parameters
  /// Request arguments: the mutable properties from 4.1's arguments, i.e. all of them
  /// except:
  ///
  /// * `blocklist-size`
  /// * `config-dir`
  /// * `rpc-version-minimum`,
  /// * `rpc-version-semver`
  /// * `rpc-version`
  /// * `session-id`
  /// * `units`
  /// * `version`
  ///
  ///## Response
  /// Response arguments: none
  ///
  Future<Map> sessionSet({
    required SessionArgs args,
  }) {
    final fs = args.argsSet(_v.rpc);
    if (fs.isEmpty) {
      throw const TransmissionException('A required args empty.');
    }
    return _v._query(
      'session-set',
      arguments: fs,
    );
  }

  ///## Session statistics
  ///
  /// To know about more
  /// [visit](https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md).
  ///
  ///## Parameters
  /// Request arguments: none
  ///
  ///## Response
  ///
  /// | Key | Value Type | Description
  /// |:--|:--|:--
  /// | `activeTorrentCount`       | number
  /// | `downloadSpeed`            | number
  /// | `pausedTorrentCount`       | number
  /// | `torrentCount`             | number
  /// | `uploadSpeed`              | number
  /// | `cumulative-stats`         | stats object (see below) From RPC4(Transmission 1.50)
  /// | `current-stats`            | stats object (see below) From RPC4(Transmission 1.50)
  ///
  /// A stats object contains:
  ///
  /// | Key | Value Type | transmission.h source
  /// |:--|:--|:--
  /// | uploadedBytes    | number     | tr_session_stats
  /// | downloadedBytes  | number     | tr_session_stats
  /// | filesAdded       | number     | tr_session_stats
  /// | sessionCount     | number     | tr_session_stats
  /// | secondsActive    | number     | tr_session_stats
  ///
  Future<Map> sessionStats() {
    return _v._query(
      'session-stats',
    );
  }

  ///## Session shutdown
  /// - From RPC12(Transmission 2.20)
  ///
  /// To know about more
  /// [visit](https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md).
  ///
  ///## Parameters
  /// Request arguments: none
  ///
  ///## Response
  /// Response arguments: none
  ///
  Future<Map> sessionClose() {
    if (_v.rpc < 12) {
      throw TransmissionException(
        'session-close API from RPC12,but now is ${_v.rpc}',
      );
    }
    return _v._query(
      'session-close',
    );
  }
}
