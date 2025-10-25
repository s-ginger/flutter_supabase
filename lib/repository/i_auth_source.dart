


abstract interface class IAuthRepository {
  Future<void> logout();
  Future<bool> register({required String username, required String email, required String password});
  Future<bool> login({required String username, required String email, required String password});
}




