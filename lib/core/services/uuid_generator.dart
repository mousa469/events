import 'package:events/core/services/id_generator.dart';
import 'package:uuid/uuid.dart';

class UuidGenerator extends IdGenerator {
  static final Uuid generator = Uuid();

  @override
  String generateID() {
    String id = generator.v4();
    return id;
  }
}
