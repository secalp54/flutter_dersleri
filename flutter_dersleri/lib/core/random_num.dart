import 'dart:math';

class RandomNumber {
  List<NumberModal> numbers = [];
  List<List<int>> matrix = [];

  List<NumberModal> randomFill(int boyut) {
    bool dev = false;
    int secilen = 1;
    int sayi = 1;
    numbers.add(NumberModal(value: Random().nextInt(boyut) + 1));
    while (secilen < boyut) {
      dev = false;
      sayi = Random().nextInt(boyut) + 1; //rasgele sayı belirle

      for (int k = 0; k < numbers.length; k++) {
        if (numbers[k].value == sayi) {
          dev = true;
          break;
        }
      }

      if (!dev) {
        numbers.add(NumberModal(value: sayi));
        secilen++;
      }
    }

    return numbers;
  }

  fillMatrixFromList(int bolum, List<int> list) {
    switch (bolum) {
      case 1:
        int sayac = 1;
        for (int i = 1; i <= list.length / 2; i++) {
          for (int k = 1; k <= list.length / 2; k++) {
            matrix[i][k] = list[sayac];
            sayac++;
          }
        }
    }
    print(matrix);
  }

  //matrixi 0 ile doldur.
  fillMatrixZero(int boyut) {
    for (int i = 1; i < boyut + 1; i++) {
      for (int k = 1; k < boyut + 1; k++) {
        matrix[i][k] = 0;
      }
    }
  }
}

class NumberModal {
  int size;
  int value;
  NumberModal({this.size = 0, required this.value});
}
