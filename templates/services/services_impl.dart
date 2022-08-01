String servicesImplTemplate = """
import '../../domain/services/{{file-name}}_services.dart';


class {{class-name}}ImplServices implements {{class-name}}Services  {
  
}
""";