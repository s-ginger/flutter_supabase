


abstract interface class IAuthRepository {
  bool get isLogin;
  Future<bool> register({required String username, required String email, required String password});
  Future<bool> login({required String username, required String email, required String password});
}




