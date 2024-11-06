import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MockClient extends Mock implements http.Client {}

void main() {
  test('Filtrar cachorros da lista retornada pela API', () async {
    final client = MockClient();

    when(() => client.get(Uri.parse('https://api.meuapp.com/animais')))
        .thenAnswer((_) async => http.Response(jsonEncode([
          {'id': 1, 'nome': 'Rex', 'especie': 'Cachorro'},
          {'id': 2, 'nome': 'Mia', 'especie': 'Gato'},
          {'id': 3, 'nome': 'Buddy', 'especie': 'Cachorro'},
        ]), 200));

    final response = await client.get(Uri.parse('https://api.meuapp.com/animais'));
    final List<dynamic> animaisData = jsonDecode(response.body);
    final cachorros = animaisData.where((animal) => animal['especie'] == 'Cachorro').toList();

    expect(cachorros.length, 2);
    expect(cachorros[0]['nome'], 'Rex');
    expect(cachorros[1]['nome'], 'Buddy');
  });
}
