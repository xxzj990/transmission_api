/// A new dart transmission rpc library
library transmission_api;

import 'dart:collection';
import 'dart:convert';
import 'dart:math' as math;

import 'package:colorize/colorize.dart';
import 'package:dio/dio.dart';

part 'src/abs/category.dart';
part 'src/abs/version.dart';
part 'src/logger/logger.dart';
part 'src/utils/auth_keys.dart';
part 'src/utils/csrf.dart';
part 'src/utils/transmission_exceptions.dart';
part 'src/versions/v1.dart';
part 'src/versions/v1/args/arg.dart';
part 'src/versions/v1/args/group.dart';
part 'src/versions/v1/args/session.dart';
part 'src/versions/v1/args/torrent.dart';
part 'src/versions/v1/category/group.dart';
part 'src/versions/v1/category/queue.dart';
part 'src/versions/v1/category/session.dart';
part 'src/versions/v1/category/system.dart';
part 'src/versions/v1/category/torrent.dart';

class Transmission {
  final bool _mock = false;

  late final String _baseUrl;

  final bool useTag;

  late V1 _v1;
  late Dio _dio;
  late Logger _logger;

  ///## Transmission
  ///
  /// Example:
  /// call Transmission().v1.waitRpcVersion() wait real RPC code.
  ///
  /// ```
  ///   final tr = Transmission(
  ///     '192.168.50.231:9093',
  ///     AuthKeys('xxx', 'xxx'),
  ///   );
  ///
  ///   await tr.v1.waitRpcVersion();
  ///
  ///   ...your code...
  ///
  /// ```
  ///
  ///## Parameters
  ///`logConfig`:
  /// Provide [logConfig]
  /// to configure your logs from [TMDB] library, by default it shows none.
  ///
  ///`format`:
  /// - If the format request was objects (default), torrents will be
  /// an array of objects, each of which contains the key/value pairs matching
  /// the request's fields arg. This was the only format before Transmission 3
  /// and has some obvious programmer conveniences, such as parsing directly
  /// into Javascript objects.
  /// - If the format was table, then torrents will be an array of arrays.
  /// The first row holds the keys and each remaining row holds a torrent's
  /// values for those keys. This format is more efficient in terms of JSON
  /// generation and JSON parsing.
  ///
  ///`useTag`:
  /// An optional tag number used by clients to track responses.
  /// If provided by a request, the response MUST include the same tag.
  ///
  Transmission(
    String url,
    AuthKeys authKeys, {
    ConfigLogger logConfig = const ConfigLogger.showNone(),
    Dio? dio,
    Interceptors? interceptors,
    this.useTag = false,
  }) {
    String tmpUrl = '';
    if (url.startsWith('http')) {
      tmpUrl = url;
    } else {
      tmpUrl = 'http://$url';
    }
    if (tmpUrl.endsWith('/')) {
      tmpUrl = tmpUrl.substring(0, url.length - 1);
    } else {
      tmpUrl = tmpUrl;
    }
    _baseUrl = tmpUrl;
    _dio = dio ??
        Dio(
          BaseOptions(
            receiveDataWhenStatusError: true,
            headers: {
              'Authorization':
                  'Basic ${base64.encode(utf8.encode('${authKeys.username}:${authKeys.password}'))}',
            },
          ),
        );
    _dio.interceptors.addAll(interceptors ?? []);
    _dio.interceptors.add(CSRF(_dio));
    _v1 = V1(this);
    _logger = Logger(logConfig)..infoLog('Api initilized ✔');

    _v1._updateVersion();
  }

  V1 get v1 => _v1;

  /// Closes dio client
  void close({bool force = false}) => _dio.close(force: force);
}
