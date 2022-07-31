
import '../features/home/data/repositories/home_impl_repository.dart';
import '../features/home/data/services/home_impl_services.dart';
import '../features/home/domain/repositories/home_repository.dart';


abstract class HomeFactory {
  static HomeRepository repository = HomeImplRepository(
    services: HomeImplServices(),
  );
}
