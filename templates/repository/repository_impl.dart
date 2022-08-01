String repositoryImplTemplate = """
import '../../domain/repositories/{{file-name}}_repository.dart';
import '../../domain/services/{{file-name}}_services.dart';

class {{class-name}}ImplRepository implements {{class-name}}Repository  {
  final {{class-name}}Services services;
  {{class-name}}ImplRepository({
    required this.services,
  });
}
""";