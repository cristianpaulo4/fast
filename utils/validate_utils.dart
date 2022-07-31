import 'package:interact/interact.dart';

class ValidateUtils {
  static bool emptyValidate(value) {
    return value.isEmpty
        ? throw ValidationError('Valor não pode ser vazio')
        : true;
  }
}
