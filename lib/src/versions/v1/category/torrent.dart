part of transmission_api;

class Torrent extends Category<V1> {
  Torrent(super.v);

  ///## Torrent accessor
  ///
  /// To know about more
  /// [visit](https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md).
  ///
  ///## Parameters
  ///`ids`:
  /// - an integer referring to a torrent id
  /// - a list of torrent id numbers, SHA1 hash strings, or both
  /// - a string, recently-active, for recently-active torrents
  /// - From RPC5(Transmission 1.60) new ids option recently-active
  ///
  ///`fields`:
  /// A required fields array of keys.
  ///
  ///`format`:
  /// - From RPC16(Transmission 3.00)
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
  ///## Response
  /// 1. A `torrents` array.
  ///
  ///    If the `format` request was `objects` (default), `torrents` will
  ///    be an array of objects, each of which contains the key/value
  ///    pairs matching the request's `fields` arg. This was the only
  ///    format before Transmission 3 and has some obvious programmer
  ///    conveniences, such as parsing directly into Javascript objects.
  ///
  ///    If the format was `table`, then `torrents` will be an array of
  ///    arrays. The first row holds the keys and each remaining row holds
  ///    a torrent's values for those keys. This format is more efficient
  ///    in terms of JSON generation and JSON parsing.
  ///
  /// 2. If the request's `ids` field was `recently-active`,
  ///    a `removed` array of torrent-id numbers of recently-removed
  ///    torrents.
  ///
  /// Example:
  ///
  /// Say we want to get the name and total size of torrents #7 and #10.
  ///
  /// Request:
  ///
  /// ```json
  /// {
  ///    "arguments": {
  ///        "fields": [ "id", "name", "totalSize" ],
  ///        "ids": [ 7, 10 ]
  ///    },
  ///    "method": "torrent-get",
  ///    "tag": 39693
  /// }
  /// ```
  ///
  /// Response:
  ///
  /// ```json
  /// {
  ///    "arguments": {
  ///       "torrents": [
  ///          {
  ///              "id": 10,
  ///              "name": "Fedora x86_64 DVD",
  ///              "totalSize": 34983493932
  ///          },
  ///          {
  ///              "id": 7,
  ///              "name": "Ubuntu x86_64 DVD",
  ///              "totalSize": 9923890123
  ///          }
  ///       ]
  ///    },
  ///    "result": "success",
  ///    "tag": 39693
  /// }
  /// ```
  ///##Note
  /// For more information on what these fields mean, see the comments
  /// in [libtransmission/transmission.h](../libtransmission/transmission.h).
  /// The 'source' column here corresponds to the data structure there.
  ///
  /// From RPC8(Transmission 1.90) new trackerStats arg lastAnnounceTimedOut
  /// From RPC8(Transmission 1.92) new trackerStats arg lastScrapeTimedOut
  ///
  Future<Map> torrentGet({
    required TorrentFields fields,
    dynamic ids,
    String? format,
  }) {
    if (ids is String && ids == 'recently-active' && _v.rpc < 5) {
      throw TransmissionException(
        'ids recently-active from RPC5,but now is ${_v.rpc}',
      );
    }

    if (ids is String && ids != 'recently-active') {
      throw const TransmissionException(
        'string ids only support recently-active.',
      );
    }

    final fs = fields.fields(_v.rpc);
    if (fs.isEmpty) {
      throw const TransmissionException('A required fields array of keys.');
    }
    return _v._query(
      'torrent-get',
      arguments: {
        if (ids != null) 'ids': ids,
        'fields': fs,
        if (_v.rpc >= 16) 'format': format ?? 'objects',
      },
    );
  }

  ///## Torrent mutator
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
  ///`args`:
  /// - Request arguments
  ///
  ///## Response
  /// Response arguments: none
  ///
  ///## Note
  /// - Just as an empty ids value is shorthand for "all ids",
  /// using an empty array for files-wanted, files-unwanted,
  /// priority-high, priority-low, or priority-normal is shorthand
  /// for saying "all files".
  Future<Map> torrentSet(
    TorrentSetArgs args, {
    dynamic ids,
  }) {
    return _v._query(
      'torrent-set',
      arguments: {
        if (ids != null) 'ids': ids,
        ...args.args(_v.rpc),
      },
    );
  }

  ///## Torrent action requests
  /// - tr_torrentStart
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
  Future<Map> torrentStart({
    dynamic ids,
  }) {
    return _v._query(
      'torrent-start',
      arguments: {
        if (ids != null) 'ids': ids,
      },
    );
  }

  ///## Torrent action requests
  /// - From RPC14(Transmission 2.40)
  /// - tr_torrentStartNow
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
  Future<Map> torrentStartNow({
    dynamic ids,
  }) {
    if (_v.rpc < 14) {
      throw TransmissionException(
        'torrent-start-now API from RPC14,but now is ${_v.rpc}',
      );
    }
    return _v._query(
      'torrent-start-now',
      arguments: {
        if (ids != null) 'ids': ids,
      },
    );
  }

  ///## Torrent action requests
  /// - tr_torrentStop
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
  Future<Map> torrentStop({
    dynamic ids,
  }) {
    return _v._query(
      'torrent-stop',
      arguments: {
        if (ids != null) 'ids': ids,
      },
    );
  }

  ///## Torrent action requests
  /// - tr_torrentVerify
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
  Future<Map> torrentVerify({
    dynamic ids,
  }) {
    return _v._query(
      'torrent-verify',
      arguments: {
        if (ids != null) 'ids': ids,
      },
    );
  }

  ///## Torrent action requests
  /// - From RPC5(Transmission 1.60)
  /// - tr_torrentManualUpdate ("ask tracker for more peers")
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
  Future<Map> torrentReannounce({
    dynamic ids,
  }) {
    if (_v.rpc < 5) {
      throw TransmissionException(
        'torrent-reannounce API from RPC5,but now is ${_v.rpc}',
      );
    }
    return _v._query(
      'torrent-reannounce',
      arguments: {
        if (ids != null) 'ids': ids,
      },
    );
  }

  ///## Adding a torrent
  ///
  /// To know about more
  /// [visit](https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md).
  ///
  ///## Parameters
  ///`filename`:
  /// - filename or URL of the .torrent file
  ///
  ///`metainfo`:
  /// - base64-encoded .torrent content
  ///
  ///## Note
  /// - Either filename or metainfo must be included.
  /// All other arguments are optional.
  ///
  /// The format of the cookies should be NAME=CONTENTS,
  /// where NAME is the cookie name and CONTENTS is what
  /// the cookie should contain. Set multiple cookies
  /// like this: name1=content1; name2=content2; etc.See
  /// [libcurl](http://curl.haxx.se/libcurl/c/curl_easy_setopt.html#CURLOPTCOOKIE)
  /// documentation for more information.
  ///
  ///## Response
  /// - On success, a torrent-added object in the form of one of 3.3's torrent
  /// objects with the fields for id, name, and hashString.
  ///
  /// - When attempting to add a duplicate torrent, a torrent-duplicate
  /// object in the same form is returned, but the response's
  /// result value is still success.
  ///
  /// From RPC15(Transmission 2.80) new return arg torrent-duplicate
  ///
  Future<Map> torrentAdd({
    String? filename,
    String? metainfo,
    TorrentAddArgs? args,
  }) {
    if (filename == null && metainfo == null) {
      throw const TransmissionException(
        'Either filename or metainfo must be included.',
      );
    }

    return _v._query(
      'torrent-add',
      arguments: {
        if (filename != null) 'filename': filename,
        if (metainfo != null) 'metainfo': metainfo,
        if (args != null) ...args.args(_v.rpc),
      },
    );
  }

  ///## Removing a torrent
  /// - From RPC3(Transmission 1.41)
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
  ///`deleteLocalData`:
  /// - delete local data. (default: false)
  ///
  ///## Response
  /// Response arguments: none
  ///
  Future<Map> torrentRemove({
    dynamic ids,
    bool? deleteLocalData,
  }) {
    if (_v.rpc < 3) {
      throw TransmissionException(
        'torrent-remove API from RPC3,but now is ${_v.rpc}',
      );
    }

    return _v._query(
      'torrent-remove',
      arguments: {
        if (ids != null) 'ids': ids,
        'delete-local-data': deleteLocalData ?? false,
      },
    );
  }

  ///## Moving a torrent
  /// - From RPC6(Transmission 1.70)
  /// To know about more
  /// [visit](https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md).
  ///
  ///## Parameters
  ///`ids`:
  /// - an integer referring to a torrent id
  /// - a list of torrent id numbers, SHA1 hash strings, or both
  /// - a string, recently-active, for recently-active torrents
  ///
  ///`location`:
  /// - the new torrent location
  ///
  ///`move`:
  /// - if true, move from previous location. otherwise,
  /// search "location" for files (default: false)
  ///
  ///## Response
  /// Response arguments: none
  ///
  Future<Map> torrentSetLocation({
    dynamic ids,
    required String location,
    bool? move,
  }) {
    if (_v.rpc < 6) {
      throw TransmissionException(
        'torrent-set-location API from RPC6,but now is ${_v.rpc}',
      );
    }
    return _v._query(
      'torrent-set-location',
      arguments: {
        if (ids != null) 'ids': ids,
        'location': location,
        'move': move ?? false,
      },
    );
  }

  ///## Renaming a torrent's path
  /// - From RPC15(Transmission 2.80)
  ///
  /// For more information on the use of this function,
  /// see the transmission.h documentation of tr_torrentRenamePath().
  /// In particular, note that if this call succeeds you'll want to
  /// update the torrent's files and name field with torrent-get.
  ///
  /// To know about more
  /// [visit](https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md).
  ///
  ///## Parameters
  ///`ids`:
  /// - must only be 1 torrent
  /// - an integer referring to a torrent id
  /// - a list of torrent id numbers, SHA1 hash strings, or both
  /// - a string, recently-active, for recently-active torrents
  ///
  ///`path`:
  /// - the path to the file or folder that will be renamed
  ///
  ///`name`:
  /// - the file or folder's new name
  ///
  ///## Response
  /// Response arguments: path, name, and id, holding the torrent ID integer
  ///
  Future<Map> torrentRenamePath({
    dynamic ids,
    required String path,
    required String name,
  }) {
    if (_v.rpc < 15) {
      throw TransmissionException(
        'torrent-rename-path API from RPC15,but now is ${_v.rpc}',
      );
    }

    if (ids is String || (ids is List && ids.length != 1)) {
      throw const TransmissionException('must only be 1 torrent');
    }

    return _v._query(
      'torrent-rename-path',
      arguments: {
        if (ids != null) 'ids': ids,
        'path': path,
        'name': name,
      },
    );
  }
}
