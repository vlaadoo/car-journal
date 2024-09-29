import 'package:car_journal/core/error/exceptions.dart';
import 'package:car_journal/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Session? get currentUserSession;

  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<UserModel?> getCurrentUserData();

  Future<void> logOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient _supabaseClient;
  AuthRemoteDataSourceImpl(this._supabaseClient);

  @override
  Session? get currentUserSession => _supabaseClient.auth.currentSession;

  @override
  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        throw ServerException('User is null');
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name,
        },
      );
      if (response.user == null) {
        throw ServerException('User is null');
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      if (currentUserSession != null) {
        final userData = await _supabaseClient.from('profiles').select().eq(
              'id',
              currentUserSession!.user.id,
            );
        return UserModel.fromJson(userData.first)
            .copyWith(email: currentUserSession!.user.email);
      }
      return null;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await _supabaseClient.auth.signOut();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
