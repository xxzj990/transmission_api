part of transmission_api;

///Configure the logs
///
///
/// *By default everything is set to `false` for production use*
///
///- `showLogs`: this one must be true to show logs
///
///- `showUrlLogs`: shows all the requests urls(�) you can use this to view the data on browser
///
///- `showInfoLogs`: (ℹ)info logs
///
///- `showWarningLogs`: (⚠)warning logs
///
///- `showErrorLogs`: (�)error logs
///
class ConfigLogger {
  final bool showLogs;
  final bool showUrlLogs;
  final bool showInfoLogs;
  final bool showWarningLogs;
  final bool showErrorLogs;
  const ConfigLogger({
    this.showLogs = false,
    this.showUrlLogs = false,
    this.showInfoLogs = false,
    this.showWarningLogs = false,
    this.showErrorLogs = false,
  });

  ///## Usage
  ///Pass this if you want to set all logs to `true` in LogConfig
  ///while creating `Transmission` instance
  ///## Example
  ///```
  ///Transmission api = Transmission(AuthKeys('username', 'password'), logConfig: ConfigLogger.showAll());
  ///```
  ///
  const ConfigLogger.showAll()
      : showLogs = true,
        showUrlLogs = true,
        showInfoLogs = true,
        showWarningLogs = true,
        showErrorLogs = true;

  ///## Usage
  ///Pass this if you want to set all logs to `false` in LogConfig
  ///while creating `Transmission` instance
  ///
  ///
  ///## Example
  ///```
  ///Transmission api = Transmission(AuthKeys('username', 'password'), logConfig: ConfigLogger.showNone());
  ///```
  ///
  const ConfigLogger.showNone()
      : showLogs = false,
        showUrlLogs = false,
        showInfoLogs = false,
        showWarningLogs = false,
        showErrorLogs = false;

  ///## Usage
  ///Pass this if you want to set all logs to `false` in LogConfig
  ///while creating `Transmission` instance
  ///
  ///
  ///## Example
  ///```
  ///Transmission api = Transmission(AuthKeys('username', 'password'), logConfig: ConfigLogger.recommended());
  ///```
  ///
  const ConfigLogger.recommended()
      : showLogs = true,
        showInfoLogs = true,
        showWarningLogs = true,
        showErrorLogs = true,
        showUrlLogs = false;
}

class Logger {
  final ConfigLogger _config;

  const Logger(this._config);

  void errorLog(String msg) {
    if (!_config.showLogs) return;
    _log(Colorize('TRANSMISSION_API--LOG(�) --ERROR-- $msg')..red());
  }

  void infoLog(String msg) {
    if (!_config.showInfoLogs) return;
    _log(Colorize('TRANSMISSION_API--LOG(ℹ) --INFO-- $msg')..green());
  }

  void warningLog(String msg) {
    if (!_config.showWarningLogs) return;
    _log(
      Colorize('TRANSMISSION_API--LOG(⚠) --WARNING-- $msg')..yellow(),
    );
  }

  void urlLog(String urlMsg) {
    if (!_config.showUrlLogs) return;
    _log(Colorize('TRANSMISSION_API--LOG(�) --URL-- \n$urlMsg')..blue());
  }

  void _log(Colorize log) {
    if (!_config.showLogs) return;
    print(log);
  }
}
