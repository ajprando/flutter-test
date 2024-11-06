import 'package:flutter/material.dart';
import '../models/animal.dart';

class AnimalWidget extends StatelessWidget {
  final Animal animal;

  const AnimalWidget({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(animal.nome)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${animal.nome}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text('Espécie: ${animal.especie}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            if (animal.idade != null)
              Text('Idade: ${animal.idade}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
