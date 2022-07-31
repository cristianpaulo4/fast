
import '../features/login/data/repositories/login_impl_repository.dart';
import '../features/login/data/services/login_impl_services.dart';
import '../features/login/domain/repositories/login_repository.dart';


abstract class LoginFactory {
  static LoginRepository repository = LoginImplRepository(
    services: LoginImplServices(),
  );
}
