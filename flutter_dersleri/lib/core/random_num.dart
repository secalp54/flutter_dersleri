import 'dart:math';

class RandomNumber {
  List<NumberModal> numbers = [];

  List<NumberModal> randomFill() {
    bool dev = false;
    int secilen = 1;
    int sayi = 1;
    numbers.add(NumberModal(value: Random().nextInt(9) + 1));
    while (secilen < 9) {
      dev = false;
      sayi = Random().nextInt(9)+1; //rasgele sayı belirle

      for (int k = 0; k < numbers.length; k++) {
        if (numbers[k].value == sayi ) {
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
}

class NumberModal {
  int size;
  int value;
  NumberModal({this.size = 0, required this.value});
}
