import '../../domain/repositories/home_repository.dart';
import '../../domain/services/home_services.dart';

class HomeImplRepository implements HomeRepository  {
  final HomeServices services;
  HomeImplRepository({
    required this.services,
  });
}