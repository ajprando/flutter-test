class Animal {
  final int id;
  final String nome;
  final String especie;
  final String? idade;

  Animal({required this.id, required this.nome, required this.especie, this.idade});

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      id: json['id'],
      nome: json['nome'],
      especie: json['especie'],
      idade: json['idade'],
    );
  }
}
