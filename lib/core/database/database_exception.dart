sealed class DataLayerException implements Exception {
  const DataLayerException(this.message, [this.cause, this.stackTrace]);

  final String message;
  final Object? cause;
  final StackTrace? stackTrace;

  @override
  String toString() => '$runtimeType: $message';
}

final class DatabaseException extends DataLayerException {
  const DatabaseException(super.message, [super.cause, super.stackTrace]);
}

final class CacheException extends DataLayerException {
  const CacheException(super.message, [super.cause, super.stackTrace]);
}

final class BackupException extends DataLayerException {
  const BackupException(super.message, [super.cause, super.stackTrace]);
}

final class SynchronizationException extends DataLayerException {
  const SynchronizationException(
    super.message, [
    super.cause,
    super.stackTrace,
  ]);
}
