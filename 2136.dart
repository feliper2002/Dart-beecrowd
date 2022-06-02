import 'dart:io';

class Pessoa {
  String? nome;
  String? resposta;

  Pessoa(this.nome, this.resposta);
}

List<Pessoa>? festaDoHabay() {
  final listaPessoas = <Pessoa>[];
  String? nome = '';
  String? resposta;

  while (listaPessoas.where((element) => element.nome == 'FIM').isEmpty) {
    nome = stdin.readLineSync();
    nome!.contains(' ')
        ? {
            resposta = nome.split(' ')[1],
            nome = nome.split(' ')[0],
          }
        : resposta = '';

    listaPessoas.add(Pessoa(nome, resposta));
  }
  listaPessoas.remove(listaPessoas.last);
  return listaPessoas;
}

List<Pessoa>? listaOrdemAlfabetica(List<Pessoa>? lista) {
  lista!.sort((p1, p2) => p1.nome!.compareTo(p2.nome!));
  return lista;
}

void main() {
  final listaFesta = festaDoHabay();
  final amigo =
      listaFesta!.firstWhere((element) => element.resposta == 'YES').nome;

  final listaAlfabetica = listaOrdemAlfabetica(listaFesta);
  final pessoasDisseramSim =
      listaAlfabetica!.where((element) => element.resposta == 'YES').toList();

  for (Pessoa p in pessoasDisseramSim) {
    print(p.nome);
  }
  print('\nAmigo do Habay:\n$amigo');
}
