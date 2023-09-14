final class Country {
  final int id;
  final String name;

  Country(this.id, this.name);
}

final class Game {
  final int id;
  final String name;

  Game(this.id, this.name);
}

final class Command {
  final String name;
  final Country country;

  Command(this.name, this.country);
}

abstract class Person {
  final String name;
  Command command;
  Country country;
  Game game;

  Person(this.name, this.command, this.country, this.game);

  void showInfo();
}

enum PlayerRole { carry, support, jungler }

final class Gamer extends Person {
  int playedMathes;
  PlayerRole role;

  Gamer(this.playedMathes, this.role, String name, Command command,
      Country country, Game game)
      : super(name, command, country, game);

  @override
  void showInfo() {
    print(
        "ИГРОК >>> Имя: $name,\nКомманда: ${command.name},\nСтрана: ${country.name},\nИгра: ${game.name}\nКоличество матчей: $playedMathes, Роль: ${role.name}");
  }
}

final class Trainer extends Person {
  int trophiesNumber;

  Trainer(this.trophiesNumber, String name, Command command, Country country,
      Game game)
      : super(name, command, country, game);

  @override
  void showInfo() {
    print(
        "ТРЕНЕР >>> Имя: $name,\nКомманда: ${command.name},\nСтрана: ${country.name},\nИгра: ${game.name}\nКоличество трофеев: $trophiesNumber");
  }
}

void main(List<String> arguments) {}
