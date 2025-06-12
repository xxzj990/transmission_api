part of transmission_api;

class TorrentAddArgs {
  final List<Arg> _args = [];

  Map<String, dynamic> args(int rpc) => UnmodifiableMapView(
        {
          for (final e in _args.where(
            (element) => rpc >= element.minRpc && rpc < element.maxRpc,
          ))
            e.name: e.value
        },
      );

  TorrentAddArgs();

  /// string
  /// - From RPC13(Transmission 2.30)
  /// - pointer to a string of one or more cookies.
  ///
  TorrentAddArgs cookies(String value) =>
      this.._args.add(Arg.fromValue('cookies', value, minRpc: 13));

  /// string
  /// - path to download the torrent to
  TorrentAddArgs downloadDir(String value) =>
      this.._args.add(Arg.fromValue('download-dir', value));

  /// array
  /// - From RPC17(Transmission 4.0.0)
  /// - array of string labels
  TorrentAddArgs labels(List<String> value) =>
      this.._args.add(Arg.fromValue('labels', value, minRpc: 17));

  /// boolean
  /// - if true, don't start the torrent
  TorrentAddArgs paused(bool value) =>
      this.._args.add(Arg.fromValue('paused', value));

  /// number
  /// - maximum number of peers
  TorrentAddArgs peerLimit(int value) =>
      this.._args.add(Arg.fromValue('peer-limit', value));

  /// number
  /// - From RPC8(Transmission 1.90)
  /// - torrent's bandwidth tr_priority_t
  TorrentAddArgs bandwidthPriority(int value) =>
      this.._args.add(Arg.fromValue('bandwidthPriority', value, minRpc: 8));

  /// array
  /// - From RPC5(Transmission 1.60)
  /// - indices of file(s) to download
  TorrentAddArgs filesWanted(List<String> value) =>
      this.._args.add(Arg.fromValue('files-wanted', value, minRpc: 5));

  /// array
  /// - From RPC5(Transmission 1.60)
  /// - indices of file(s) to not download
  TorrentAddArgs filesUnwanted(List<String> value) =>
      this.._args.add(Arg.fromValue('files-unwanted', value, minRpc: 5));

  /// array
  /// - From RPC5(Transmission 1.60)
  /// - indices of high-priority file(s)
  TorrentAddArgs priorityHigh(List<String> value) =>
      this.._args.add(Arg.fromValue('priority-high', value, minRpc: 5));

  /// array
  /// - From RPC5(Transmission 1.60)
  /// - indices of low-priority file(s)
  TorrentAddArgs priorityLow(List<String> value) =>
      this.._args.add(Arg.fromValue('priority-low', value, minRpc: 5));

  /// array
  /// - From RPC5(Transmission 1.60)
  /// - indices of normal-priority file(s)
  TorrentAddArgs priorityNormal(List<String> value) =>
      this.._args.add(Arg.fromValue('priority-normal', value, minRpc: 5));
}

class TorrentSetArgs {
  final List<Arg> _args = [];

  Map<String, dynamic> args(int rpc) => UnmodifiableMapView(
        {
          for (final e in _args.where(
            (element) => rpc >= element.minRpc && rpc < element.maxRpc,
          ))
            e.name: e.value
        },
      );

  TorrentSetArgs();

  /// number
  /// - From RPC5(Transmission 1.60)
  /// - this torrent's bandwidth tr_priority_t
  TorrentSetArgs bandwidthPriority(int value) =>
      this.._args.add(Arg.fromValue('bandwidthPriority', value, minRpc: 5));

  /// number
  /// - From RPC5(Transmission 1.60)
  /// - maximum download speed (KBps)
  TorrentSetArgs downloadLimit(int value) =>
      this.._args.add(Arg.fromValue('downloadLimit', value, minRpc: 5));

  /// number
  /// - Delete From RPC5(Transmission 1.60)
  /// - renamed speed-limit-down to downloadLimit
  /// - maximum download speed (KBps)
  TorrentSetArgs speedLimitDown(int value) =>
      this.._args.add(Arg.fromValue('speed-limit-down', value, maxRpc: 5));

  /// boolean
  /// - From RPC5(Transmission 1.60)
  /// - true if downloadLimit is honored
  TorrentSetArgs downloadLimited(bool value) =>
      this.._args.add(Arg.fromValue('downloadLimited', value, minRpc: 5));

  /// number
  /// - Delete From RPC5(Transmission 1.60)
  /// - renamed speed-limit-down-enabled to downloadLimited
  /// - maximum download speed (KBps)
  TorrentSetArgs speedLimitDownEnabled(int value) => this
    .._args.add(Arg.fromValue('speed-limit-down-enabled', value, maxRpc: 5));

  /// array
  /// - indices of file(s) to not download
  TorrentSetArgs filesUnwanted(List<String> value) =>
      this.._args.add(Arg.fromValue('files-unwanted', value));

  /// array
  /// - indices of file(s) to download
  TorrentSetArgs filesWanted(List<String> value) =>
      this.._args.add(Arg.fromValue('files-wanted', value));

  /// string
  /// - From RPC17(Transmission 4.0.0)
  /// - The name of this torrent's bandwidth group
  TorrentSetArgs group(String value) =>
      this.._args.add(Arg.fromValue('group', value, minRpc: 17));

  /// boolean
  /// - From RPC5(Transmission 1.60)
  /// - true if session upload limits are honored
  TorrentSetArgs honorsSessionLimits(bool value) =>
      this.._args.add(Arg.fromValue('honorsSessionLimits', value, minRpc: 5));

  /// array
  /// - From RPC16(Transmission 3.00)
  /// - array of string labels
  TorrentSetArgs labels(List<String> value) =>
      this.._args.add(Arg.fromValue('labels', value, minRpc: 16));

  /// string
  /// - new location of the torrent's content
  TorrentSetArgs location(String value) =>
      this.._args.add(Arg.fromValue('location', value));

  /// number
  /// - maximum number of peers
  TorrentSetArgs peerLimit(int value) =>
      this.._args.add(Arg.fromValue('peer-limit', value));

  /// array
  /// - indices of high-priority file(s)
  TorrentSetArgs priorityHigh(List<String> value) =>
      this.._args.add(Arg.fromValue('priority-high', value));

  /// array
  /// - indices of low-priority file(s)
  TorrentSetArgs priorityLow(List<String> value) =>
      this.._args.add(Arg.fromValue('priority-low', value));

  /// array
  /// - indices of normal-priority file(s)
  TorrentSetArgs priorityNormal(List<String> value) =>
      this.._args.add(Arg.fromValue('priority-normal', value));

  /// number
  /// - From RPC14(Transmission 2.40)
  /// - position of this torrent in its queue [0...n)
  TorrentSetArgs queuePosition(int value) =>
      this.._args.add(Arg.fromValue('queuePosition', value, minRpc: 14));

  /// number
  /// - From RPC10(Transmission 2.10)
  /// - torrent-level number of minutes of seeding inactivity
  TorrentSetArgs seedIdleLimit(int value) =>
      this.._args.add(Arg.fromValue('seedIdleLimit', value, minRpc: 10));

  /// number
  /// - From RPC10(Transmission 2.10)
  /// - which seeding inactivity to use. See tr_idlelimit
  TorrentSetArgs seedIdleMode(int value) =>
      this.._args.add(Arg.fromValue('seedIdleMode', value, minRpc: 10));

  /// double
  /// - From RPC5(Transmission 1.60)
  /// - torrent-level seeding ratio
  TorrentSetArgs seedRatioLimit(double value) =>
      this.._args.add(Arg.fromValue('seedRatioLimit', value, minRpc: 5));

  /// double
  /// - From RPC5(Transmission 1.60)
  /// - torrent-level seeding ratio
  TorrentSetArgs seedRatioLimited(double value) =>
      this.._args.add(Arg.fromValue('seedRatioLimited', value, minRpc: 5));

  /// number
  /// - which ratio to use. See tr_ratiolimit
  TorrentSetArgs seedRatioMode(int value) =>
      this.._args.add(Arg.fromValue('seedRatioMode', value));

  /// boolean
  /// - From RPC18(Transmission 4.1.0)
  /// - download torrent pieces sequentially
  TorrentSetArgs sequentialDownload(bool value) =>
      this.._args.add(Arg.fromValue('sequentialDownload', value, minRpc: 18));

  /// string
  /// - From RPC17(Transmission 4.0.0)
  /// string of announce URLs, one per line, and a blank line between
  /// [tiers](https://www.bittorrent.org/beps/bep_0012.html).
  TorrentSetArgs trackerList(String value) =>
      this.._args.add(Arg.fromValue('trackerList', value, minRpc: 17));

  /// array
  /// - From RPC10(Transmission 2.10)
  /// - Delete From RPC17(Transmission 4.0.0)
  /// - DEPRECATED use trackerList instead
  TorrentSetArgs trackerAdd(List<String> value) => this
    .._args.add(Arg.fromValue('trackerAdd', value, minRpc: 10, maxRpc: 17));

  /// array
  /// - From RPC10(Transmission 2.10)
  /// - Delete From RPC17(Transmission 4.0.0)
  /// - DEPRECATED use trackerList instead
  TorrentSetArgs trackerRemove(List<String> value) => this
    .._args.add(Arg.fromValue('trackerRemove', value, minRpc: 10, maxRpc: 17));

  /// array
  /// - From RPC10(Transmission 2.10)
  /// - Delete From RPC17(Transmission 4.0.0)
  /// - DEPRECATED use trackerList instead
  TorrentSetArgs trackerReplace(List<String> value) => this
    .._args.add(Arg.fromValue('trackerReplace', value, minRpc: 10, maxRpc: 17));

  /// number
  /// - From RPC5(Transmission 1.60)
  /// - maximum upload speed (KBps)
  TorrentSetArgs uploadLimit(int value) =>
      this.._args.add(Arg.fromValue('uploadLimit', value, minRpc: 5));

  /// number
  /// - Delete From RPC5(Transmission 1.60)
  /// - renamed speed-limit-up to uploadLimit
  /// - maximum upload speed (KBps)
  TorrentSetArgs speedLimitUp(int value) =>
      this.._args.add(Arg.fromValue('speed-limit-up', value, maxRpc: 5));

  /// boolean
  /// - From RPC5(Transmission 1.60)
  /// - true if uploadLimit is honored
  TorrentSetArgs uploadLimited(bool value) =>
      this.._args.add(Arg.fromValue('uploadLimited', value, minRpc: 5));

  /// boolean
  /// - Delete From RPC5(Transmission 1.60)
  /// - renamed speed-limit-up-enabled to uploadLimited
  /// - true if uploadLimit is honored
  TorrentSetArgs speedLimitUpEnabled(bool value) => this
    .._args.add(Arg.fromValue('speed-limit-up-enabled', value, maxRpc: 5));
}

class TorrentFields {
  final List<Arg> _fields = [];

  List<String> fields(int rpc) => UnmodifiableListView(
        _fields
            .where((element) => rpc >= element.minRpc && rpc < element.maxRpc)
            .map((e) => e.name)
            .toSet()
            .toList(),
      );

  TorrentFields();

  factory TorrentFields.id() => TorrentFields().id;

  factory TorrentFields.basic() => TorrentFields()
      .id
      .name
      .status
      .percentDone
      .error
      .errorString
      .rateDownload
      .rateUpload;

  /// number
  TorrentFields get activityDate =>
      this.._fields.add(Arg.fromName('activityDate'));

  /// number
  TorrentFields get addedDate => this.._fields.add(Arg.fromName('addedDate'));

  /// array
  /// - From RPC17(Transmission 4.0.0)
  /// - An array of pieceCount numbers representing the number of connected peers
  /// that have each piece, or -1 if we already have the piece ourselves.
  TorrentFields get availability =>
      this.._fields.add(Arg.fromName('availability', minRpc: 17));

  /// number
  /// - From RPC5(Transmission 1.60)
  TorrentFields get bandwidthPriority =>
      this.._fields.add(Arg.fromName('bandwidthPriority', minRpc: 5));

  /// string
  TorrentFields get comment => this.._fields.add(Arg.fromName('comment'));

  /// number
  TorrentFields get corruptEver =>
      this.._fields.add(Arg.fromName('corruptEver'));

  /// string
  TorrentFields get creator => this.._fields.add(Arg.fromName('creator'));

  /// number
  TorrentFields get dateCreated =>
      this.._fields.add(Arg.fromName('dateCreated'));

  /// number
  TorrentFields get desiredAvailable =>
      this.._fields.add(Arg.fromName('desiredAvailable'));

  /// number
  TorrentFields get doneDate => this.._fields.add(Arg.fromName('doneDate'));

  /// string
  /// - From RPC4(Transmission 1.50)
  TorrentFields get downloadDir =>
      this.._fields.add(Arg.fromName('downloadDir', minRpc: 4));

  /// number
  TorrentFields get downloadedEver =>
      this.._fields.add(Arg.fromName('downloadedEver'));

  /// number
  TorrentFields get downloadLimit =>
      this.._fields.add(Arg.fromName('downloadLimit'));

  /// - Delete From RPC5(Transmission 1.60)
  TorrentFields get downloadLimitMode =>
      this.._fields.add(Arg.fromName('downloadLimitMode', maxRpc: 5));

  /// boolean
  TorrentFields get downloadLimited =>
      this.._fields.add(Arg.fromName('downloadLimited'));

  /// - From RPC3(Transmission 1.41)
  /// - Delete From RPC7(Transmission 1.80)
  /// - removed arg downloaders (use trackerStats instead)
  TorrentFields get downloaders =>
      this.._fields.add(Arg.fromName('downloaders', minRpc: 3, maxRpc: 7));

  /// number
  /// - From RPC16(Transmission 3.00)
  TorrentFields get editDate =>
      this.._fields.add(Arg.fromName('editDate', minRpc: 16));

  /// number
  TorrentFields get error => this.._fields.add(Arg.fromName('error'));

  /// string
  TorrentFields get errorString =>
      this.._fields.add(Arg.fromName('errorString'));

  /// number
  TorrentFields get eta => this.._fields.add(Arg.fromName('eta'));

  /// number
  /// - From RPC15(Transmission 2.80)
  TorrentFields get etaIdle =>
      this.._fields.add(Arg.fromName('etaIdle', minRpc: 15));

  /// number
  /// - From RPC17(Transmission 4.0.0)
  TorrentFields get fileCount =>
      this.._fields.add(Arg.fromName('file-count', minRpc: 17));

  /// array
  /// - array of objects, each containing
  /// | Key | Value Type | transmission.h source
  /// |:--|:--|:--
  /// | `bytesCompleted` | number | tr_file_view
  /// | `length` | number | tr_file_view
  /// | `name` | string | tr_file_view
  /// | `beginPiece` | number | tr_file_view From RPC18(Transmission 4.1.0)
  /// | `endPiece` | number | tr_file_view From RPC18(Transmission 4.1.0)
  ///
  TorrentFields get files => this.._fields.add(Arg.fromName('files'));

  /// array
  /// - From RPC5(Transmission 1.60)
  /// - a file's non-constant properties.
  /// An array of tr_info.filecount objects, each containing
  /// | Key | Value Type | transmission.h source
  /// |:--|:--|:--
  /// | `bytesCompleted` | number | tr_file_view
  /// | `wanted` | number | tr_file_view
  /// | `priority` | number | tr_file_view
  ///
  /// - Note: (wanted) For backwards compatibility,
  /// this is serialized as an array of 0 or 1 that should be treated as booleans
  ///
  TorrentFields get fileStats =>
      this.._fields.add(Arg.fromName('fileStats', minRpc: 5));

  /// string
  /// - From RPC17(Transmission 4.0.0)
  TorrentFields get group =>
      this.._fields.add(Arg.fromName('group', minRpc: 17));

  /// string
  TorrentFields get hashString => this.._fields.add(Arg.fromName('hashString'));

  /// number
  TorrentFields get haveUnchecked =>
      this.._fields.add(Arg.fromName('haveUnchecked'));

  /// number
  TorrentFields get haveValid => this.._fields.add(Arg.fromName('haveValid'));

  /// boolean
  /// - From RPC5(Transmission 1.60)
  TorrentFields get honorsSessionLimits =>
      this.._fields.add(Arg.fromName('honorsSessionLimits', minRpc: 5));

  /// number
  TorrentFields get id => this.._fields.add(Arg.fromName('id'));

  /// boolean
  /// - From RPC9(Transmission 2.00)
  TorrentFields get isFinished =>
      this.._fields.add(Arg.fromName('isFinished', minRpc: 9));

  /// boolean
  TorrentFields get isPrivate => this.._fields.add(Arg.fromName('isPrivate'));

  /// boolean
  /// - From RPC14(Transmission 2.40)
  TorrentFields get isStalled =>
      this.._fields.add(Arg.fromName('isStalled', minRpc: 14));

  /// array of strings
  /// - From RPC16(Transmission 3.00)
  TorrentFields get labels =>
      this.._fields.add(Arg.fromName('labels', minRpc: 16));

  /// number
  TorrentFields get leftUntilDone =>
      this.._fields.add(Arg.fromName('leftUntilDone'));

  /// string
  /// - From RPC7(Transmission 1.80)
  TorrentFields get magnetLink =>
      this.._fields.add(Arg.fromName('magnetLink', minRpc: 7));

  /// number
  TorrentFields get manualAnnounceTime =>
      this.._fields.add(Arg.fromName('manualAnnounceTime'));

  /// number
  TorrentFields get maxConnectedPeers =>
      this.._fields.add(Arg.fromName('maxConnectedPeers'));

  /// double
  /// - From RPC7(Transmission 1.80)
  TorrentFields get metadataPercentComplete =>
      this.._fields.add(Arg.fromName('metadataPercentComplete', minRpc: 7));

  /// string
  TorrentFields get name => this.._fields.add(Arg.fromName('name'));

  /// number
  TorrentFields get peerLimit => this.._fields.add(Arg.fromName('peer-limit'));

  /// array
  /// - From RPC2(Transmission 1.40)
  /// - an array of objects, each containing
  /// | Key | Value Type | transmission.h source
  /// |:--|:--|:--
  /// | `address`            | string     | tr_peer_stat
  /// | `clientName`         | string     | tr_peer_stat
  /// | `clientIsChoked`     | boolean    | tr_peer_stat
  /// | `clientIsInterested` | boolean    | tr_peer_stat
  /// | `flagStr`            | string     | tr_peer_stat
  /// | `isDownloadingFrom`  | boolean    | tr_peer_stat
  /// | `isEncrypted`        | boolean    | tr_peer_stat
  /// | `isIncoming`         | boolean    | tr_peer_stat
  /// | `isUploadingTo`      | boolean    | tr_peer_stat
  /// | `isUTP`              | boolean    | tr_peer_stat
  /// | `peerIsChoked`       | boolean    | tr_peer_stat
  /// | `peerIsInterested`   | boolean    | tr_peer_stat
  /// | `port`               | number     | tr_peer_stat
  /// | `progress`           | double     | tr_peer_stat
  /// | `rateToClient` (B/s) | number     | tr_peer_stat
  /// | `rateToPeer` (B/s)   | number     | tr_peer_stat
  ///
  TorrentFields get peers =>
      this.._fields.add(Arg.fromName('peers', minRpc: 2));

  /// Delete From RPC13(Transmission 2.30)
  TorrentFields get peersKnown =>
      this.._fields.add(Arg.fromName('peersKnown', maxRpc: 13));

  /// array
  /// - RPC2(Transmission 1.40) new port to peers
  TorrentFields get port => this.._fields.add(Arg.fromName('port'));

  /// object
  /// - an object containing
  /// | Key | Value Type | transmission.h source
  /// |:--|:--|:--
  /// | `fromCache`    | number     | tr_stat
  /// | `fromDht`      | number     | tr_stat
  /// | `fromIncoming` | number     | tr_stat
  /// | `fromLpd`      | number     | tr_stat From RPC14(Transmission 2.40)
  /// | `fromLtep`     | number     | tr_stat
  /// | `fromPex`      | number     | tr_stat
  /// | `fromTracker`  | number     | tr_stat
  ///
  TorrentFields get peersFrom => this.._fields.add(Arg.fromName('peersFrom'));

  /// number
  TorrentFields get peersGettingFromUs =>
      this.._fields.add(Arg.fromName('peersGettingFromUs'));

  /// number
  TorrentFields get peersSendingToUs =>
      this.._fields.add(Arg.fromName('peersSendingToUs'));

  /// double
  /// - From RPC17(Transmission 4.0.0)
  TorrentFields get percentComplete =>
      this.._fields.add(Arg.fromName('percentComplete', minRpc: 17));

  /// double
  /// - From RPC5(Transmission 1.60)
  TorrentFields get percentDone =>
      this.._fields.add(Arg.fromName('percentDone', minRpc: 5));

  /// string
  /// - From RPC5(Transmission 1.60)
  /// - A bitfield holding pieceCount flags which are set to 'true'
  /// if we have the piece matching that position.
  /// JSON doesn't allow raw binary data, so this is a base64-encoded string.
  /// (Source: tr_torrent)
  TorrentFields get pieces =>
      this.._fields.add(Arg.fromName('pieces', minRpc: 5));

  /// number
  TorrentFields get pieceCount => this.._fields.add(Arg.fromName('pieceCount'));

  /// number
  TorrentFields get pieceSize => this.._fields.add(Arg.fromName('pieceSize'));

  /// array
  /// - An array of `tr_torrentFileCount()` numbers.
  /// Each is the `tr_priority_t` mode for the corresponding file.
  TorrentFields get priorities => this.._fields.add(Arg.fromName('priorities'));

  /// string
  /// - From RPC17(Transmission 4.0.0)
  TorrentFields get primaryMimeType =>
      this.._fields.add(Arg.fromName('primary-mime-type', minRpc: 17));

  /// number
  /// - From RPC14(Transmission 2.40)
  TorrentFields get queuePosition =>
      this.._fields.add(Arg.fromName('queuePosition', minRpc: 14));

  /// number (B/s)
  TorrentFields get rateDownload =>
      this.._fields.add(Arg.fromName('rateDownload'));

  /// number (B/s)
  TorrentFields get rateUpload => this.._fields.add(Arg.fromName('rateUpload'));

  /// double
  TorrentFields get recheckProgress =>
      this.._fields.add(Arg.fromName('recheckProgress'));

  /// number
  TorrentFields get secondsDownloading =>
      this.._fields.add(Arg.fromName('secondsDownloading'));

  /// number
  TorrentFields get secondsSeeding =>
      this.._fields.add(Arg.fromName('secondsSeeding'));

  /// number
  TorrentFields get seedIdleLimit =>
      this.._fields.add(Arg.fromName('seedIdleLimit'));

  /// number
  TorrentFields get seedIdleMode =>
      this.._fields.add(Arg.fromName('seedIdleMode'));

  /// double
  /// - From RPC5(Transmission 1.60)
  TorrentFields get seedRatioLimit =>
      this.._fields.add(Arg.fromName('seedRatioLimit', minRpc: 5));

  /// double
  /// - From RPC5(Transmission 1.60)
  TorrentFields get seedRatioLimited =>
      this.._fields.add(Arg.fromName('seedRatioLimited', minRpc: 5));

  /// number
  /// - From RPC5(Transmission 1.60)
  TorrentFields get seedRatioMode =>
      this.._fields.add(Arg.fromName('seedRatioMode', minRpc: 5));

  /// boolean
  /// - From RPC18(Transmission 4.1.0)
  TorrentFields get sequentialDownload =>
      this.._fields.add(Arg.fromName('sequentialDownload', minRpc: 18));

  /// number
  TorrentFields get sizeWhenDone =>
      this.._fields.add(Arg.fromName('sizeWhenDone'));

  /// number
  TorrentFields get startDate => this.._fields.add(Arg.fromName('startDate'));

  /// number
  /// - A number between 0 and 6, where
  /// | Value | Meaning
  /// |:--|:--
  /// | 0 | Torrent is stopped
  /// | 1 | Torrent is queued to verify local data
  /// | 2 | Torrent is verifying local data
  /// | 3 | Torrent is queued to download
  /// | 4 | Torrent is downloading
  /// | 5 | Torrent is queued to seed
  /// | 6 | Torrent is seeding
  ///
  TorrentFields get status => this.._fields.add(Arg.fromName('status'));

  /// array
  /// - array of objects, each containing
  /// | Key | Value Type | transmission.h source
  /// |:--|:--|:--
  /// | `announce` | string | tr_tracker_view
  /// | `id` | number | tr_tracker_view
  /// | `scrape` | string | tr_tracker_view
  /// | `sitename` | string | tr_tracker_view From RPC17(Transmission 4.0.0)
  /// | `tier` | number | tr_tracker_view
  ///
  TorrentFields get trackers => this.._fields.add(Arg.fromName('trackers'));

  /// string
  /// - From RPC17(Transmission 4.0.0)
  /// - string of announce URLs, one per line, with a blank line between tiers
  TorrentFields get trackerList =>
      this.._fields.add(Arg.fromName('trackerList', minRpc: 17));

  /// array
  /// - From RPC7(Transmission 1.80)
  /// - array of objects, each containing
  /// | Key | Value Type | transmission.h source
  /// |:--|:--|:--
  /// | `announceState`           | number     | tr_tracker_view
  /// | `announce`                | string     | tr_tracker_view
  /// | `downloadCount`           | number     | tr_tracker_view
  /// | `hasAnnounced`            | boolean    | tr_tracker_view
  /// | `hasScraped`              | boolean    | tr_tracker_view
  /// | `host`                    | string     | tr_tracker_view
  /// | `id`                      | number     | tr_tracker_view
  /// | `isBackup`                | boolean    | tr_tracker_view
  /// | `lastAnnouncePeerCount`   | number     | tr_tracker_view
  /// | `lastAnnounceResult`      | string     | tr_tracker_view
  /// | `lastAnnounceStartTime`   | number     | tr_tracker_view
  /// | `lastAnnounceSucceeded`   | boolean    | tr_tracker_view
  /// | `lastAnnounceTime`        | number     | tr_tracker_view
  /// | `lastAnnounceTimedOut`    | boolean    | tr_tracker_view
  /// | `lastScrapeResult`        | string     | tr_tracker_view
  /// | `lastScrapeStartTime`     | number     | tr_tracker_view
  /// | `lastScrapeSucceeded`     | boolean    | tr_tracker_view
  /// | `lastScrapeTime`          | number     | tr_tracker_view
  /// | `lastScrapeTimedOut`      | boolean    | tr_tracker_view
  /// | `leecherCount`            | number     | tr_tracker_view
  /// | `nextAnnounceTime`        | number     | tr_tracker_view
  /// | `nextScrapeTime`          | number     | tr_tracker_view
  /// | `scrapeState`             | number     | tr_tracker_view
  /// | `scrape`                  | string     | tr_tracker_view
  /// | `seederCount`             | number     | tr_tracker_view
  /// | `sitename`                | string     | tr_tracker_view From RPC17(Transmission 4.0.0)
  /// | `tier`                    | number     | tr_tracker_view
  ///
  TorrentFields get trackerStats =>
      this.._fields.add(Arg.fromName('trackerStats', minRpc: 7));

  /// - Delete From RPC7(Transmission 1.80)
  /// - removed arg announceResponse (use trackerStats instead)
  TorrentFields get announceResponse =>
      this.._fields.add(Arg.fromName('announceResponse', maxRpc: 7));

  /// - Delete From RPC7(Transmission 1.80)
  /// - removed arg announceURL (use trackerStats instead)
  TorrentFields get announceURL =>
      this.._fields.add(Arg.fromName('announceURL', maxRpc: 7));

  /// - Delete From RPC7(Transmission 1.80)
  /// - removed arg lastAnnounceTime (use trackerStats instead)
  TorrentFields get lastAnnounceTime =>
      this.._fields.add(Arg.fromName('lastAnnounceTime', maxRpc: 7));

  /// - Delete From RPC7(Transmission 1.80)
  /// - removed arg lastScrapeTime (use trackerStats instead)
  TorrentFields get lastScrapeTime =>
      this.._fields.add(Arg.fromName('lastScrapeTime', maxRpc: 7));

  /// - Delete From RPC7(Transmission 1.80)
  /// - leechers (use trackerStats instead)
  TorrentFields get leechers =>
      this.._fields.add(Arg.fromName('leechers', maxRpc: 7));

  /// - Delete From RPC7(Transmission 1.80)
  /// - removed arg nextAnnounceTime (use trackerStats instead)
  TorrentFields get nextAnnounceTime =>
      this.._fields.add(Arg.fromName('nextAnnounceTime', maxRpc: 7));

  /// - Delete From RPC7(Transmission 1.80)
  /// - removed arg nextScrapeTime (use trackerStats instead)
  TorrentFields get nextScrapeTime =>
      this.._fields.add(Arg.fromName('nextScrapeTime', maxRpc: 7));

  /// - Delete From RPC7(Transmission 1.80)
  /// - removed arg scrapeResponse (use trackerStats instead)
  TorrentFields get scrapeResponse =>
      this.._fields.add(Arg.fromName('scrapeResponse', maxRpc: 7));

  /// - Delete From RPC7(Transmission 1.80)
  /// - removed arg scrapeURL (use trackerStats instead)
  TorrentFields get scrapeURL =>
      this.._fields.add(Arg.fromName('scrapeURL', maxRpc: 7));

  /// - Delete From RPC7(Transmission 1.80)
  /// - removed arg seeders (use trackerStats instead)
  TorrentFields get seeders =>
      this.._fields.add(Arg.fromName('seeders', maxRpc: 7));

  /// - Delete From RPC7(Transmission 1.80)
  /// - removed arg timesCompleted (use trackerStats instead)
  TorrentFields get timesCompleted =>
      this.._fields.add(Arg.fromName('timesCompleted', maxRpc: 7));

  /// - Delete From RPC7(Transmission 1.80)
  TorrentFields get swarmSpeed =>
      this.._fields.add(Arg.fromName('swarmSpeed', maxRpc: 7));

  /// number
  TorrentFields get totalSize => this.._fields.add(Arg.fromName('totalSize'));

  /// string
  /// - From RPC5(Transmission 1.60)
  TorrentFields get torrentFile =>
      this.._fields.add(Arg.fromName('torrentFile', minRpc: 5));

  /// number
  TorrentFields get uploadedEver =>
      this.._fields.add(Arg.fromName('uploadedEver'));

  /// number
  TorrentFields get uploadLimit =>
      this.._fields.add(Arg.fromName('uploadLimit'));

  /// - Delete From RPC5(Transmission 1.60)
  TorrentFields get uploadLimitMode =>
      this.._fields.add(Arg.fromName('uploadLimitMode', maxRpc: 5));

  /// boolean
  TorrentFields get uploadLimited =>
      this.._fields.add(Arg.fromName('uploadLimited'));

  /// double
  TorrentFields get uploadRatio =>
      this.._fields.add(Arg.fromName('uploadRatio'));

  /// array
  /// - An array of `tr_torrentFileCount()` Booleans true
  /// if the corresponding file is to be downloaded.
  /// (Source: `tr_file_view`)
  ///
  ///## Note
  /// old arg wanted was implemented as an array of 0 or 1 in
  /// Transmission 3.00 and older, despite being documented as an
  /// array of booleans. Transmission 4.0.0 and 4.0.1 "fixed" this
  /// by returning an array of booleans; but in practical terms,
  /// this change caused an unannounced breaking change for
  /// any 3rd party code that expected 0 or 1. For this reason,
  /// 4.0.2 restored the 3.00 behavior and updated this spec to
  /// match the code.
  ///
  TorrentFields get wanted => this.._fields.add(Arg.fromName('wanted'));

  /// array of strings
  TorrentFields get webseeds => this.._fields.add(Arg.fromName('webseeds'));

  /// number
  TorrentFields get webseedsSendingToUs =>
      this.._fields.add(Arg.fromName('webseedsSendingToUs'));
}
