import 'package:flutter/material.dart';
import 'package:mobile/screens/animal_widget.dart';
import 'models/animal.dart';

void main() {
  runApp(AdocaoApp());
}

class AdocaoApp extends StatelessWidget {
  const AdocaoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adoção de animais',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimalListScreen(),
    );
  }
}

class AnimalListScreen extends StatelessWidget {
  final List<Animal> animals = [
    Animal(id: 1, nome: 'Rex', especie: 'Cachorro', idade: '2 anos'),
    Animal(id: 2, nome: 'Mia', especie: 'Gato', idade: '1 ano'),
    Animal(id: 3, nome: 'Buddy', especie: 'Cachorro', idade: '3 anos'),
  ];

  AnimalListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animais disponíveis para adoção:'),
      ),
      body: ListView.builder(
        itemCount: animals.length,
        itemBuilder: (context, index) {
          final animal = animals[index];
          return ListTile(
            title: Text(animal.nome),
            subtitle: Text('${animal.especie} - ${animal.idade}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnimalWidget(animal: animal),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
