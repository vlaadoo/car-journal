import 'package:car_journal/core/error/failure.dart';
import 'package:car_journal/core/usecase/usecase.dart';
import 'package:car_journal/core/common/entities/user.dart';
import 'package:car_journal/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository _authRepository;
  CurrentUser(this._authRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await _authRepository.currentUser();
  }
}

class NoParams {}
