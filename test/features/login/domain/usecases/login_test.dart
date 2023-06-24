import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/features/login/domain/entities/login.dart';
import 'package:flutter_clean_architecture/features/login/domain/repositories/login_reponsitory.dart';
import 'package:flutter_clean_architecture/features/login/domain/usecases/post_login.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

void main() {
  late PostLogin usecase;
  late MockLoginRepository mockLoginRepository;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    usecase = PostLogin(mockLoginRepository);
  });

  final String email = "example@gmai.com";
  final String password = "123";

  final Login login = Login(email: email, password: password);

  test("should post login from the repository", () async {
    when(mockLoginRepository.postLogin("example@gmai.com", "123"))
        .thenAnswer((_) async => Right(login));

    final result = await usecase(Params(email), Params(password));

    expect(result, Right(login));
    verify(mockLoginRepository.postLogin(email, password));
    verifyNoMoreInteractions(mockLoginRepository);
  });
}
