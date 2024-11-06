import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/models/animal.dart';
import 'package:mobile/services/animal_service.dart';

void main() {
  test('Filtrar animais por espécie', () {
    List<Animal> animais = [
      Animal(id: 1, nome: 'Rex', especie: 'Cachorro'),
      Animal(id: 2, nome: 'Mia', especie: 'Gato'),
      Animal(id: 3, nome: 'Buddy', especie: 'Cachorro'),
    ];

    List<Animal> cachorros = AnimalService.filtrarPorEspecie(animais, 'Cachorro');

    expect(cachorros.length, 2);
    expect(cachorros[0].nome, 'Rex');
    expect(cachorros[1].nome, 'Buddy');
  });
}
