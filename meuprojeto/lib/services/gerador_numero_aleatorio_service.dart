import 'dart:math';

class GeradorNumeroAleatorioService {
  static int gerarNumeroAleatorio(int num_max) {
    Random numeroAleatorio = Random();
    return numeroAleatorio.nextInt(num_max);
  }
}
