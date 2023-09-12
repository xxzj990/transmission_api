part of transmission_api;

class Queue extends Category<V1> {
  Queue(super.v);

  ///## Queue movement requests
  /// - From RPC14(Transmission 2.40)
  /// - tr_torrentQueueMoveTop()
  ///
  /// To know about more
  /// [visit](https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md).
  ///
  ///## Parameters
  ///`ids`:
  /// - an integer referring to a torrent id
  /// - a list of torrent id numbers, SHA1 hash strings, or both
  /// - a string, recently-active, for recently-active torrents
  ///
  ///## Response
  /// Response arguments: none
  ///
  Future<Map> queueMoveTop({
    dynamic ids,
  }) {
    if (_v.rpc < 14) {
      throw TransmissionException(
        'queue-move-top API from RPC14,but now is ${_v.rpc}',
      );
    }
    return _v._query(
      'queue-move-top',
      arguments: {
        if (ids != null) 'ids': ids,
      },
    );
  }

  ///## Queue movement requests
  /// - From RPC14(Transmission 2.40)
  /// - tr_torrentQueueMoveUp()
  ///
  /// To know about more
  /// [visit](https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md).
  ///
  ///## Parameters
  ///`ids`:
  /// - an integer referring to a torrent id
  /// - a list of torrent id numbers, SHA1 hash strings, or both
  /// - a string, recently-active, for recently-active torrents
  ///
  ///## Response
  /// Response arguments: none
  ///
  Future<Map> queueMoveUp({
    dynamic ids,
  }) {
    if (_v.rpc < 14) {
      throw TransmissionException(
        'queue-move-up API from RPC14,but now is ${_v.rpc}',
      );
    }
    return _v._query(
      'queue-move-up',
      arguments: {
        if (ids != null) 'ids': ids,
      },
    );
  }

  ///## Queue movement requests
  /// - From RPC14(Transmission 2.40)
  /// - tr_torrentQueueMoveDown()
  ///
  /// To know about more
  /// [visit](https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md).
  ///
  ///## Parameters
  ///`ids`:
  /// - an integer referring to a torrent id
  /// - a list of torrent id numbers, SHA1 hash strings, or both
  /// - a string, recently-active, for recently-active torrents
  ///
  ///## Response
  /// Response arguments: none
  ///
  Future<Map> queueMoveDown({
    dynamic ids,
  }) {
    if (_v.rpc < 14) {
      throw TransmissionException(
        'queue-move-down API from RPC14,but now is ${_v.rpc}',
      );
    }
    return _v._query(
      'queue-move-down',
      arguments: {
        if (ids != null) 'ids': ids,
      },
    );
  }

  ///## Queue movement requests
  /// - From RPC14(Transmission 2.40)
  /// - tr_torrentQueueMoveBottom()
  ///
  /// To know about more
  /// [visit](https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md).
  ///
  ///## Parameters
  ///`ids`:
  /// - an integer referring to a torrent id
  /// - a list of torrent id numbers, SHA1 hash strings, or both
  /// - a string, recently-active, for recently-active torrents
  ///
  ///## Response
  /// Response arguments: none
  ///
  Future<Map> queueMoveBottom({
    dynamic ids,
  }) {
    if (_v.rpc < 14) {
      throw TransmissionException(
        'queue-move-bottom API from RPC14,but now is ${_v.rpc}',
      );
    }
    return _v._query(
      'queue-move-bottom',
      arguments: {
        if (ids != null) 'ids': ids,
      },
    );
  }
}
