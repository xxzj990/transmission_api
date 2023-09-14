# transmission_api

<p align="center">
<img src="https://transmissionbt.com/assets/images/Transmission_icon.png" height=100px><img src="https://avatars.githubusercontent.com/u/1609975?s=100&v=4" height="100px">  
</p>

A Transmission client library for dart.
To know more about transmission visit [*offical site*](https://transmissionbt.com/)

Thanks [tmdb_api](https://github.com/RatakondalaArun/tmdb_api),most of the code comes from it.

## Getting started

1) **Adding as dependencies**

   [Pub.dev's installation guide](https://pub.dev/packages/transmission_api#-installing-tab-)

   Add this to your package's pubspec.yaml file:

    ```yaml
    dependencies:
      transmission_api: latest
    ```

2) **Import it**

   Now in your Dart code, you can use:

    ```dart
    import 'package:transmission_api/transmission_api.dart';
    ```

3) **Create Instance**

   Now you need to create instance for `Transmission` and `AuthKeys` with your api keys.

    ```dart
    final transmission = Transmission( //Transmission instance
        AuthKeys('Username', 'Password'),//AuthKeys instance with your keys,
      );

    await transmission.v1.waitRpcVersion();// Get real rpc version,default 18.
    ```

4) **Configuring console logs**

   There are 3 logconfigs presets avaliable.

    - `ConfigLogger.showAll()`: development use.
    - `ConfigLogger.showRecommended()`: development use.
    - `ConfigLogger.showNone()`: production use.

   You can add any off this presets to `logConfig` named parameter of `Transmission` instance
   **Custom Logs**

    ```dart
    final transmission = Transmission(
        AuthKeys('Username', 'Password'),
        logConfig: ConfigLogger(
          showLogs: true,//must be true than only all other logs will be shown
          showErrorLogs: true,
        ),
      );
    ```

## Example

For getting torrents list

```dart
Map result = await transmission.v1.torrent.torrentGet(fields: TorrentFields.basic());
```

### Custom Dio instance

```dart
    final transmission = Transmission(
        AuthKeys('Username', 'Password'),
        dio:Dio()// your own dio instance
      );
```

### Adding Interceptors

```dart
final transmission = Transmission(
    AuthKeys('Username', 'Password'),
    interceptors:Interceptors()..add(/*your interceptor*/)
    );
```

or

```dart
final customDio = Dio();
customDio.interceptors.add(/*your interceptor*/)

final transmission = Transmission(
    AuthKeys('Username', 'Password'),
    dio:dio
    );
```

note:*Use interceptors only when you are not using a custom `Dio` instance*.

## For more API documentation

visit [offical API documentation](https://github.com/transmission/transmission/blob/main/docs/rpc-spec.md)