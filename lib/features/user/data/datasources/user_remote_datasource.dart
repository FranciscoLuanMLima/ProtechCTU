import '../../domain/entities/user_profile.dart';

/// Contrato da borda remota. Uma implementação Firebase pode ser injetada
/// sem alterar o armazenamento local nem o domínio.
abstract interface class UserRemoteDataSource {
  Future<void> pushOperation(UserSyncOperation operation);
}
