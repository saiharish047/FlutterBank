extension NullChecking on Object? {
  bool get _isNull => this == null;

  bool get isNotEmptyOrNull {
    if (_isNull) return false;

    if (this is String) return (this as String).isNotEmpty;

    if (this is Iterable) return (this as Iterable).isNotEmpty;

    if (this is Map) return (this as Map).isNotEmpty;

    return true;
  }

  bool get isEmptyOrNull =>
      _isNull | _isStringObjectEmpty | _isMapObjectEmpty | _isIterableEmpty;

  bool get _isStringObjectEmpty =>
      (this is String) ? (this as String).isEmpty : false;

  bool get _isMapObjectEmpty => (this is Map) ? (this as Map).isEmpty : false;

  bool get _isIterableEmpty =>
      (this is Iterable) ? (this as Iterable).isEmpty : false;
}
