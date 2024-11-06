import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/models/animal.dart';
import 'package:mobile/services/favoritos_service.dart';

void main() {
  test('Adicionar animal aos favoritos', () {
    FavoritosService favoritosService = FavoritosService();

    Animal animal = Animal(id: 1, nome: 'Rex', especie: 'Cachorro');
    favoritosService.adicionarAosFavoritos(animal);

    expect(favoritosService.favoritos.contains(animal), true);
  });
}
