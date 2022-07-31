import '../../domain/repositories/login_repository.dart';
import '../../domain/services/login_services.dart';

class LoginImplRepository implements LoginRepository  {
  final LoginServices services;
  LoginImplRepository({
    required this.services,
  });
}