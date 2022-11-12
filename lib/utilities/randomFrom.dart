import 'dart:math';

randomFrom<T>(List<T> list) {
  return list[Random().nextInt(list.length)];
}
