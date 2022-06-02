import 'dart:io';

int fatorial(int numero) {
  if (verificacao(numero)) {
    if (numero == 0 || numero == 1) return 1;

    return numero * fatorial(numero - 1);
  }
  return 0;
}

List<String> separa(String input) {
  if (input.contains(" ")) {
    return input.split(" ");
  }
  return ["0", "0"];
}

bool verificacao(int valor) {
  return (valor >= 0 && valor <= 20);
}

int somaFatoriais(int valor1, int valor2) {
  return fatorial(valor1) + fatorial(valor2);
}

main() {
  while (true) {
    String input = (stdin.readLineSync() ?? "");

    if (input == "") break;

    List<String> separada = separa(input);

    int primeiro = int.parse(separada[0]);
    int segundo = int.parse(separada[1]);
    print(somaFatoriais(primeiro, segundo));
  }
}
