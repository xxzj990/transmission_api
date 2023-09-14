part of transmission_api;

class V1 extends Version {
  late final Torrent _torrent;
  late final Session _session;
  late final Queue _queue;
  late final Group _group;
  late final System _system;

  Torrent get torrent => _torrent;

  Session get session => _session;

  Queue get queue => _queue;

  Group get group => _group;

  System get system => _system;

  late bool _versionUpdated = false;

  V1(super.transmission) {
    _torrent = Torrent(this);
    _session = Session(this);
    _queue = Queue(this);
    _group = Group(this);
    _system = System(this);
  }

  /// create new tag
  static int newTag() {
    return math.Random().nextInt(100000);
  }

  /// check RPC version
  Future<void> waitRpcVersion() async {
    while (true) {
      if (_versionUpdated) {
        break;
      }
      _tr._logger.infoLog('wait rpc version update...');
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  Future<void> _updateVersion() async {
    try {
      final value =
          await session.sessionGet(fields: SessionArgs().rpcVersion());
      final args = value['arguments'];
      if (args != null && args is Map) {
        final tmp = args['rpc-version'];
        if (tmp != null && tmp is int) {
          rpc = tmp;
          _tr._logger.infoLog('update current RPC version as $rpc');
        }
      }
    } catch (e) {
      _tr._logger.errorLog('_updateVersion fail.$e');
    }

    _versionUpdated = true;
  }

  Future<Map> _query(
    String method, {
    dynamic arguments,
  }) async {
    final url = '${_tr._baseUrl}/transmission/rpc';
    _tr._logger.infoLog(url);
    final dio = _tr._dio;
    try {
      final data = {
        'method': method,
        'arguments': arguments,
      };

      final tag = newTag();
      if (_tr.useTag) {
        data['tag'] = tag;
      }

      _tr._logger.infoLog(jsonEncode(data));
      if (_tr._mock) {
        return {};
      } else {
        final Response<Map> response = await dio.post(
          url,
          data: data,
        );

        if (_tr.useTag) {
          final resTag = response.data!['tag'];
          if (resTag != tag) {
            throw TransmissionException(
              'response tag err.expect $tag,response $resTag',
            );
          }
        }

        return response.data!;
      }
    } on DioException catch (e) {
      throw TransmissionDioError(
        e.message!,
        orginal: e,
        statusCode: e.response?.statusCode,
      );
    } catch (e, s) {
      _tr._logger.errorLog(
        'Exception while making a request. Exception = {$e',
      );
      _tr._logger.infoLog(
        'You can create a issue at https://github.com/xxzj990/transmission_api/issues',
      );
      //if error is unknown rethrow it
      // rethrow;
      throw TransmissionOtherException(
        'error/unknown',
        orginal: e,
        stackTrace: s,
      );
    }
  }
}
