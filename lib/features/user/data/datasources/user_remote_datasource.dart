import '../../domain/entities/user_profile.dart';

/// Contrato da borda remota. Uma implementacao Firebase pode ser injetada
/// sem alterar o armazenamento local nem o dominio.
abstract interface class UserRemoteDataSource {
  Future<void> pushOperation(UserSyncOperation operation);
}
