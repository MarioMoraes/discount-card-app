abstract class AuthRepository {
  Future<bool> signIn(String email, String password);
}
