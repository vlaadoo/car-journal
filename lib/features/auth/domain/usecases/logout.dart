import 'package:car_journal/core/error/failure.dart';
import 'package:car_journal/core/usecase/usecase.dart';
import 'package:car_journal/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class Logout implements UseCase<void, NoParams> {
  final AuthRepository _authRepository;
  Logout(this._authRepository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await _authRepository.logOut();
  }
}
