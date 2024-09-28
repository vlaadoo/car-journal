import 'package:car_journal/core/error/failure.dart';
import 'package:car_journal/core/usecase/usecase.dart';
import 'package:car_journal/core/common/entities/user.dart';
import 'package:car_journal/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserLogin implements UseCase<User, UserLoginParams> {
  final AuthRepository _authRepository;
  UserLogin(this._authRepository);

  @override
  Future<Either<Failure, User>> call(UserLoginParams params) async {
    return _authRepository.loginWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({
    required this.email,
    required this.password,
  });
}
