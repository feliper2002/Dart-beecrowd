import 'dart:io';

empilha(List<String> pilha, String valor) {
  for (var i = 0; i < (valor.length); i++) {
    pilha.add(valor[i]);
  }
}

List<String> concatenaPilhas(List<String> primeira, List<String> segunda) {
  int i = 0;
  int j = 0;
  List<String> pilhaConcatenada = [];

  bool primeiraMaior = (primeira.length > segunda.length);
  bool segundaMaior = (segunda.length > primeira.length);

  for (i; i < primeira.length;) {
    pilhaConcatenada.add(primeira[i]);
    for (j; j < segunda.length;) {
      pilhaConcatenada.add(segunda[j]);
      j++;
      break;
    }
    i++;
  }

  if (primeiraMaior) {
    for (i; i < primeira.length; i++) {
      pilhaConcatenada.add(primeira[i]);
    }
  }
  if (segundaMaior) {
    for (j; j < segunda.length; j++) {
      pilhaConcatenada.add(segunda[j]);
    }
  }

  return pilhaConcatenada;
}

String palavraConcatenada(List<String> pilhaConcatenada) {
  String contatenada = '';
  for (var k = 0; k < pilhaConcatenada.length; k++) {
    contatenada += pilhaConcatenada[k];
  }
  return contatenada;
}

List<String> fraseSeparada(String frase) {
  if (frase.contains(" ")) {
    final splitted = frase.split(" ");
    if (splitted[0].length < 50 && splitted[1].length < 50) {
      return splitted;
    }
  }
  return [];
}

main() {
  int _casos = int.parse(stdin.readLineSync() ?? "0");
  int k = 0;

  while (k < _casos) {
    String frase = stdin.readLineSync() ?? "";

    final separada = fraseSeparada(frase);

    List<String> pilhaPrimeira = [];
    List<String> pilhaSegunda = [];

    empilha(pilhaPrimeira, separada[0]);
    empilha(pilhaSegunda, separada[1]);

    final pilhaConcatenada = concatenaPilhas(pilhaPrimeira, pilhaSegunda);

    print(palavraConcatenada(pilhaConcatenada));
    k++;
  }
}
