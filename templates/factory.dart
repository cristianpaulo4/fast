
String factoryTemplate = """
import '../features/{{file-name}}/data/repositories/{{file-name}}_impl_repository.dart';
import '../features/{{file-name}}/data/services/{{file-name}}_impl_services.dart';
import '../features/{{file-name}}/domain/repositories/{{file-name}}_repository.dart';


abstract class {{class-name}}Factory {
  static {{class-name}}Repository repository = {{class-name}}ImplRepository(
    services: {{class-name}}ImplServices(),
  );
}
""";