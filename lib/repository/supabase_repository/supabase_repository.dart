import 'package:my_notesflutter/repository/repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseRepository implements IAuthRepository {
  final SupabaseClient _client;

  const SupabaseRepository({required SupabaseClient client}) : _client = client;

  @override
  Future<bool> login({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signInWithPassword(
          email: email,
          password: password
      );

      if (response.user != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user != null) {
        var userid = response.user?.id;
        print('Пользователь зарегистрирован: ${response.user!.email}');
        await _client.from('users').insert({'id': userid!, 'name': username});

        return true;
      } else {
        print('Регистрация прошла, но подтверждение email требуется.');
        return false;
      }
    } on AuthException catch (error) {
      print('Ошибка регистрации: ${error.message}');
      return false;
    } catch (e) {
      print('Неизвестная ошибка: $e');
      return false;
    }
  }

  @override
  // TODO: implement token
  bool get isLogin => false;
}
