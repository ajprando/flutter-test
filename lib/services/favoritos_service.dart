import '../models/animal.dart';

class FavoritosService {
  final List<Animal> favoritos = [];

  void adicionarAosFavoritos(Animal animal) {
    if (!favoritos.contains(animal)) {
      favoritos.add(animal);
    }
  }

  void removerDosFavoritos(Animal animal) {
    favoritos.remove(animal);
  }
}
