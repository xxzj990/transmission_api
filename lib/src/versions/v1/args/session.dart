part of transmission_api;

class SessionArgs {
  final List<Arg> _args = [];

  /// Read only args
  static final List<String> _argsReadOnly = UnmodifiableListView([
    'blocklist-size',
    'config-dir',
    'rpc-version-minimum',
    'rpc-version-semver',
    'rpc-version',
    'session-id',
    'units',
    'version',
  ]);

  Map<String, dynamic> argsSet(int rpc) => UnmodifiableMapView(
        {
          for (final e in _args.where(
            (element) =>
                !_argsReadOnly.contains(element.name) &&
                rpc >= element.minRpc &&
                rpc < element.maxRpc,
          ))
            e.name: e.value
        },
      );

  List<String> argsGet(int rpc) => UnmodifiableListView(
        _args
            .where((element) => rpc >= element.minRpc && rpc < element.maxRpc)
            .map((e) => e.name)
            .toSet()
            .toList(),
      );

  SessionArgs();

  /// number
  /// - From RPC5(Transmission 1.60)
  /// - when to turn on alt speeds (units: minutes after midnight)
  SessionArgs altSpeedBegin([int? value]) =>
      this.._args.add(Arg.fromValue('alt-speed-begin', value, minRpc: 5));

  /// number
  /// - From RPC5(Transmission 1.60)
  /// - max global download speed (KBps)
  SessionArgs altSpeedDown([int? value]) =>
      this.._args.add(Arg.fromValue('alt-speed-down', value, minRpc: 5));

  /// boolean
  /// - From RPC5(Transmission 1.60)
  /// - true means use the alt speeds
  SessionArgs altSpeedEnabled([bool? value]) =>
      this.._args.add(Arg.fromValue('alt-speed-enabled', value, minRpc: 5));

  /// number
  /// - From RPC5(Transmission 1.60)
  /// - when to turn off alt speeds (units: same)
  SessionArgs altSpeedEnd([int? value]) =>
      this.._args.add(Arg.fromValue('alt-speed-end', value, minRpc: 5));

  /// number
  /// - when to turn on alt speeds (units: minutes after midnight)
  SessionArgs altSpeedTimeBegin([int? value]) =>
      this.._args.add(Arg.fromValue('alt-speed-time-begin', value));

  /// number
  /// - what day(s) to turn on alt speeds (look at tr_sched_day)
  SessionArgs altSpeedTimeDay([int? value]) =>
      this.._args.add(Arg.fromValue('alt-speed-time-day', value));

  /// boolean
  /// - From RPC5(Transmission 1.60)
  /// - true means the scheduled on/off times are used
  SessionArgs altSpeedTimeEnabled([bool? value]) => this
    .._args.add(Arg.fromValue('alt-speed-time-enabled', value, minRpc: 5));

  /// number
  /// - when to turn off alt speeds (units: same)
  SessionArgs altSpeedTimeEnd([int? value]) =>
      this.._args.add(Arg.fromValue('alt-speed-time-end', value));

  /// number
  /// - From RPC5(Transmission 1.60)
  /// - max global upload speed (KBps)
  SessionArgs altSpeedUp([int? value]) =>
      this.._args.add(Arg.fromValue('alt-speed-up', value, minRpc: 5));

  /// boolean
  /// - From RPC5(Transmission 1.60)
  /// - true means enabled
  SessionArgs blocklistEnabled([bool? value]) =>
      this.._args.add(Arg.fromValue('blocklist-enabled', value, minRpc: 5));

  /// number
  /// - From RPC5(Transmission 1.60)
  /// - number of rules in the blocklist
  ///
  ///## Note
  /// read only
  ///
  SessionArgs blocklistSize() =>
      this.._args.add(Arg.fromName('blocklist-size', minRpc: 5));

  /// string
  /// - From RPC11(Transmission 2.12)
  /// - location of the blocklist to use for blocklist-update
  SessionArgs blocklistUrl([String? value]) =>
      this.._args.add(Arg.fromValue('blocklist-url', value, minRpc: 11));

  /// number
  /// - From RPC10(Transmission 2.10)
  /// - maximum size of the disk cache (MB)
  SessionArgs cacheSizeMb([int? value]) =>
      this.._args.add(Arg.fromValue('cache-size-mb', value, minRpc: 10));

  /// string
  /// - From RPC8(Transmission 1.90)
  /// - location of transmission's configuration directory
  ///
  ///## Note
  /// read only
  ///
  SessionArgs configDir() =>
      this.._args.add(Arg.fromName('config-dir', minRpc: 8));

  /// string
  /// - From RPC17(Transmission 4.0.0)
  /// announce URLs, one per line, and a blank line between
  /// [tiers](https://www.bittorrent.org/beps/bep_0012.html).
  SessionArgs defaultTrackers([String? value]) =>
      this.._args.add(Arg.fromValue('default-trackers', value, minRpc: 17));

  /// boolean
  /// - true means allow DHT in public torrents
  SessionArgs dhtEnabled([bool? value]) =>
      this.._args.add(Arg.fromValue('dht-enabled', value));

  /// string
  /// - default path to download torrents
  SessionArgs downloadDir([String? value]) =>
      this.._args.add(Arg.fromValue('download-dir', value));

  /// number
  /// - From RPC12(Transmission 2.20)
  /// - Delete From RPC17(Transmission 4.0.0)
  /// - DEPRECATED Use the free-space method instead.
  SessionArgs downloadDirFreeSpace([int? value]) => this
    .._args.add(
      Arg.fromValue('download-dir-free-space', value, minRpc: 12, maxRpc: 17),
    );

  /// boolean
  /// - From RPC14(Transmission 2.40)
  /// - if true, limit how many torrents can be downloaded at once
  SessionArgs downloadQueueEnabled([bool? value]) => this
    .._args.add(Arg.fromValue('download-queue-enabled', value, minRpc: 14));

  /// number
  /// - From RPC14(Transmission 2.40)
  /// - max number of torrents to download at once (see download-queue-enabled)
  SessionArgs downloadQueueSize([int? value]) =>
      this.._args.add(Arg.fromValue('download-queue-size', value, minRpc: 14));

  /// string
  /// - required, preferred, tolerated
  SessionArgs encryption([String? value]) =>
      this.._args.add(Arg.fromValue('encryption', value));

  /// boolean
  /// - From RPC10(Transmission 2.10)
  /// - true if the seeding inactivity limit is honored by default
  SessionArgs idleSeedingLimitEnabled([bool? value]) => this
    .._args.add(Arg.fromValue('idle-seeding-limit-enabled', value, minRpc: 10));

  /// number
  /// - From RPC10(Transmission 2.10)
  /// - torrents we're seeding will be stopped if they're idle for this long
  SessionArgs idleSeedingLimit([int? value]) =>
      this.._args.add(Arg.fromValue('idle-seeding-limit', value, minRpc: 10));

  /// boolean
  /// - From RPC7(Transmission 1.80)
  /// - true means keep torrents in incomplete-dir until done
  SessionArgs incompleteDirEnabled([bool? value]) => this
    .._args.add(Arg.fromValue('incomplete-dir-enabled', value, minRpc: 7));

  /// string
  /// - From RPC7(Transmission 1.80)
  /// - path for incomplete torrents, when enabled
  SessionArgs incompleteDir([String? value]) =>
      this.._args.add(Arg.fromValue('incomplete-dir', value, minRpc: 7));

  /// boolean
  /// - true means allow Local Peer Discovery in public torrents
  SessionArgs lpdEnabled([bool? value]) =>
      this.._args.add(Arg.fromValue('lpd-enabled', value));

  /// number
  /// - From RPC5(Transmission 1.60)
  /// - maximum global number of peers
  SessionArgs peerLimitGlobal([int? value]) =>
      this.._args.add(Arg.fromValue('peer-limit-global', value, minRpc: 5));

  /// number
  /// - Delete From RPC5(Transmission 1.60)
  /// - renamed peer-limit to peer-limit-global
  /// - maximum global number of peers
  SessionArgs peerLimit([int? value]) =>
      this.._args.add(Arg.fromValue('peer-limit', value, maxRpc: 5));

  /// number
  /// - From RPC5(Transmission 1.60)
  /// - maximum global number of peers
  SessionArgs peerLimitPerTorrent([int? value]) => this
    .._args.add(Arg.fromValue('peer-limit-per-torrent', value, minRpc: 5));

  /// boolean
  /// - true means pick a random peer port on launch
  SessionArgs peerPortRandomOnStart([bool? value]) =>
      this.._args.add(Arg.fromValue('peer-port-random-on-start', value));

  /// number
  /// - From RPC5(Transmission 1.60)
  /// - port number
  SessionArgs peerPort([int? value]) =>
      this.._args.add(Arg.fromValue('peer-port', value, minRpc: 5));

  /// number
  /// - Delete From RPC5(Transmission 1.60)
  /// - renamed port to peer-port
  /// - port number
  SessionArgs port([int? value]) =>
      this.._args.add(Arg.fromValue('port', value, maxRpc: 5));

  /// boolean
  /// - From RPC5(Transmission 1.60)
  /// - true means allow PEX in public torrents
  SessionArgs pexEnabled([bool? value]) =>
      this.._args.add(Arg.fromValue('pex-enabled', value, minRpc: 5));

  /// boolean
  /// - Delete From RPC5(Transmission 1.60)
  /// - renamed pex-allowed to pex-enabled
  /// - true means allow PEX in public torrents
  SessionArgs pexAllowed([bool? value]) =>
      this.._args.add(Arg.fromValue('pex-allowed', value, maxRpc: 5));

  /// boolean
  /// - true means ask upstream router to forward the configured
  /// peer port to transmission using UPnP or NAT-PMP
  SessionArgs portForwardingEnabled([bool? value]) =>
      this.._args.add(Arg.fromValue('port-forwarding-enabled', value));

  /// boolean
  /// - From RPC14(Transmission 2.40)
  /// - whether or not to consider idle torrents as stalled
  SessionArgs queueStalledEnabled([bool? value]) => this
    .._args.add(Arg.fromValue('queue-stalled-enabled', value, minRpc: 14));

  /// number
  /// - From RPC14(Transmission 2.40)
  /// - torrents that are idle for N minuets aren't counted toward seed-queue-size or download-queue-size
  SessionArgs queueStalledMinutes([int? value]) => this
    .._args.add(Arg.fromValue('queue-stalled-minutes', value, minRpc: 14));

  /// boolean
  /// - From RPC8(Transmission 1.90)
  /// - true means append .part to incomplete files
  SessionArgs renamePartialFiles([bool? value]) =>
      this.._args.add(Arg.fromValue('rename-partial-files', value, minRpc: 8));

  /// number
  /// - From RPC4(Transmission 1.50)
  /// - the minimum RPC API version supported
  ///
  /// rpc-version-minimum indicates the oldest API supported by the RPC server.
  /// It is changes when a new version of Transmission changes the RPC
  /// interface in a way that is not backwards compatible.
  /// There are no plans for this to be common behavior.
  ///
  ///## Note
  /// read only
  ///
  SessionArgs rpcVersionMinimum() =>
      this.._args.add(Arg.fromName('rpc-version-minimum', minRpc: 4));

  /// string
  /// - From RPC17(Transmission 4.0.0)
  ///
  /// the current RPC API version in a
  /// [semver](https://semver.org)-compatible string
  ///
  ///## Note
  /// read only
  ///
  SessionArgs rpcVersionSemver() =>
      this.._args.add(Arg.fromName('rpc-version-semver', minRpc: 17));

  /// number
  /// - From RPC4(Transmission 1.50)
  /// - the current RPC API version
  ///
  /// rpc-version indicates the RPC interface version
  /// supported by the RPC server.It is incremented
  /// when a new version of Transmission changes the RPC interface.
  ///
  ///## Note
  /// read only
  ///
  SessionArgs rpcVersion() =>
      this.._args.add(Arg.fromName('rpc-version', minRpc: 4));

  /// boolean
  /// - From RPC17(Transmission 4.0.0)
  /// - whether or not to call the added script
  SessionArgs scriptTorrentAddedEnabled([bool? value]) => this
    .._args
        .add(Arg.fromValue('script-torrent-added-enabled', value, minRpc: 17));

  /// string
  /// - From RPC17(Transmission 4.0.0)
  /// - filename of the script to run
  SessionArgs scriptTorrentAddedFilename([String? value]) => this
    .._args
        .add(Arg.fromValue('script-torrent-added-filename', value, minRpc: 17));

  /// boolean
  /// - whether or not to call the done script
  SessionArgs scriptTorrentDoneEnabled([bool? value]) =>
      this.._args.add(Arg.fromValue('script-torrent-done-enabled', value));

  /// string
  /// - filename of the script to run
  SessionArgs scriptTorrentDoneFilename([String? value]) =>
      this.._args.add(Arg.fromValue('script-torrent-done-filename', value));

  /// boolean
  /// - From RPC17(Transmission 4.0.0)
  /// - whether or not to call the seeding-done script
  SessionArgs scriptTorrentDoneSeedingEnabled([bool? value]) => this
    .._args.add(Arg.fromValue('script-torrent-done-seeding-enabled', value,
        minRpc: 17));

  /// string
  /// - From RPC17(Transmission 4.0.0)
  /// - filename of the script to run
  SessionArgs scriptTorrentDoneSeedingFilename([String? value]) => this
    .._args.add(Arg.fromValue('script-torrent-done-seeding-filename', value,
        minRpc: 17));

  /// boolean
  /// - From RPC14(Transmission 2.40)
  /// - if true, limit how many torrents can be uploaded at once
  SessionArgs seedQueueEnabled([bool? value]) =>
      this.._args.add(Arg.fromValue('seed-queue-enabled', value, minRpc: 14));

  /// number
  /// - From RPC14(Transmission 2.40)
  /// - max number of torrents to uploaded at once (see seed-queue-enabled)
  SessionArgs seedQueueSize([int? value]) =>
      this.._args.add(Arg.fromValue('seed-queue-size', value, minRpc: 14));

  /// double
  /// - From RPC5(Transmission 1.60)
  /// - the default seed ratio for torrents to use
  SessionArgs seedRatioLimit([double? value]) =>
      this.._args.add(Arg.fromValue('seedRatioLimit', value, minRpc: 5));

  /// boolean
  /// - From RPC5(Transmission 1.60)
  /// - true if seedRatioLimit is honored by default
  SessionArgs seedRatioLimited([bool? value]) =>
      this.._args.add(Arg.fromValue('seedRatioLimited', value, minRpc: 5));

  /// string
  /// - From RPC16(Transmission 3.00)
  /// - the current X-Transmission-Session-Id value
  ///
  ///## Note
  /// read only
  ///
  SessionArgs sessionId() =>
      this.._args.add(Arg.fromName('session-id', minRpc: 16));

  /// boolean
  /// - true means enabled
  SessionArgs speedLimitDownEnabled([bool? value]) =>
      this.._args.add(Arg.fromValue('speed-limit-down-enabled', value));

  /// number
  /// - max global download speed (KBps)
  SessionArgs speedLimitDown([int? value]) =>
      this.._args.add(Arg.fromValue('speed-limit-down', value));

  /// boolean
  /// - true means enabled
  SessionArgs speedLimitUpEnabled([bool? value]) =>
      this.._args.add(Arg.fromValue('speed-limit-up-enabled', value));

  /// number
  /// - max global upload speed (KBps)
  SessionArgs speedLimitUp([int? value]) =>
      this.._args.add(Arg.fromValue('speed-limit-up', value));

  /// boolean
  /// - From RPC9(Transmission 2.00)
  /// - true means added torrents will be started right away
  SessionArgs startAddedTorrents([bool? value]) =>
      this.._args.add(Arg.fromValue('start-added-torrents', value, minRpc: 9));

  /// boolean
  /// - From RPC9(Transmission 2.00)
  /// - true means the .torrent file of added torrents will be deleted
  SessionArgs trashOriginalTorrentFiles([bool? value]) => this
    .._args
        .add(Arg.fromValue('trash-original-torrent-files', value, minRpc: 9));

  /// object
  /// - From RPC10(Transmission 2.10)
  ///
  /// an object containing
  ///
  /// | Key | Value Type | transmission.h source
  /// |:--|:--|:--
  /// | `speed-units`  | array  | 4 strings: KB/s, MB/s, GB/s, TB/s
  /// | `speed-bytes`  | number | number of bytes in a KB (1000 for kB; 1024 for KiB)
  /// | `size-units`   | array  | 4 strings: KB/s, MB/s, GB/s, TB/s
  /// | `size-bytes`   | number | number of bytes in a KB (1000 for kB; 1024 for KiB)
  /// | `memory-units` | array  | 4 strings: KB/s, MB/s, GB/s, TB/s
  /// | `memory-bytes` | number | number of bytes in a KB (1000 for kB; 1024 for KiB)
  ///
  ///## Note
  /// read only
  ///
  SessionArgs units() => this.._args.add(Arg.fromName('units', minRpc: 10));

  /// boolean
  /// - true means allow UTP
  SessionArgs utpEnabled([bool? value]) =>
      this.._args.add(Arg.fromValue('utp-enabled', value));

  /// string
  /// - From RPC3(Transmission 1.41)
  /// - long version string $version ($revision)
  ///
  ///## Note
  /// read only
  ///
  SessionArgs version() => this.._args.add(Arg.fromName('version', minRpc: 3));
}
