import '../models/animal.dart';

class AnimalService {
  static List<Animal> filtrarPorEspecie(List<Animal> animais, String especie) {
    return animais.where((animal) => animal.especie.toLowerCase() == especie.toLowerCase()).toList();
  }
}
