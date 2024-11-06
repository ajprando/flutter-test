import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/animal.dart';

class ApiService {
  final String baseUrl = 'http://localhost:3000';

  Future<Animal?> createAnimal(Animal animal) async {
    final response = await http.post(
      Uri.parse('$baseUrl/animais'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nome': animal.nome,
        'especie': animal.especie,
        'idade': animal.idade,
      }),
    );

    if (response.statusCode == 201) {
      return Animal.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao criar o animal');
    }
  }

  Future<List<Animal>> getAllAnimals() async {
    final response = await http.get(Uri.parse('$baseUrl/animais'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Animal.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao buscar os animais');
    }
  }

  Future<Animal?> getAnimalById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/animais/$id'));

    if (response.statusCode == 200) {
      return Animal.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao buscar o animal');
    }
  }

  Future<Animal?> updateAnimal(Animal animal) async {
    final response = await http.put(
      Uri.parse('$baseUrl/animais/${animal.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nome': animal.nome,
        'especie': animal.especie,
        'idade': animal.idade,
      }),
    );

    if (response.statusCode == 200) {
      return Animal.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao atualizar o animal');
    }
  }

  Future<bool> deleteAnimal(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/animais/$id'));

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Falha ao deletar o animal');
    }
  }
}
