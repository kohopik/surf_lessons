typedef Strategy = double Function(List<String>, List<String>);

class PokerPlayer {
  /// Список текущих карт в руке у игрока
  List<String> _currentHand = ['King of clubs', 'Nine of hearts'];

  /// Субъективная оценка выигрыша
  double _surenessInWin = 0;

  /// Вычислить шансы на выигрыш
  void calculateProbabilities(
    List<String> cardOnDesk,
    Strategy strategy,
  ) =>
      _surenessInWin = strategy(cardOnDesk, _currentHand);
}

void main() {
  final opponent = PokerPlayer();

  final Strategy fakeStrategy = (p0, p1) {
    // Я в покере не силен, да и к томуже много факторов для вычисления вероятности выигрыша,
    // поэтому напишу какую-то рандомную логику определения вероятности.
    // Допустим каждя пара добавит 10% к шансу победы
    double sureness = 0;
    final personCardTypes = p1.map((e) => e.split(" ").first.toLowerCase());
    final boardCardTypes = p0.map((e) => e.split(" ").first.toLowerCase());
    boardCardTypes.forEach((element) {
      if (personCardTypes.contains(element)) {
        sureness += 0.1;
      }
    });
    return sureness;
  };

  opponent.calculateProbabilities(
    ['Nine of diamonds', 'king of hearts'],
    fakeStrategy,
  );
}
