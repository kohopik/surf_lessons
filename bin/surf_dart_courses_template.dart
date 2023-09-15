import 'input.dart';

void main(List<String> arguments) {
  List<Territory> territories = mapAfter2010.values
      .expand((element) => element)
      .toList()
    ..addAll(mapBefore2010.values.expand((element) => element).toList());
  List<num> machinesAges = territories
      .expand((e) => e.machineries)
      .toSet()
      .map((e) => DateTime.now().year - e.releaseDate.year)
      .toList()
    ..sort((a, b) => b.compareTo(a));

  print("Средний возраст всей техники ${averageFrom(machinesAges)}");

  final middleIndex = (machinesAges.length / 2).ceil();
  print(
      "Средний возраст 50% старой техники ${averageFrom(machinesAges.sublist(0, middleIndex))}");
}

num averageFrom(List<num> list) {
  return list.fold<num>(0, (a, b) => a + b) / list.length;
}
