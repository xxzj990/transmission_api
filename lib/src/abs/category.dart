part of transmission_api;

/// Base calss of [Category]s
abstract class Category<V extends Version> {
  /// Version type
  final V _v;

  /// Creates a instance of [this]
  Category(this._v);
}
