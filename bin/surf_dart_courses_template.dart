enum PaymentType { card, money }

enum Feedback { fine, notFine }

void main(List<String> arguments) {
  // Поездка в такси

  final timeToWork = DateTime(2023, 9, 15, 10);
  // Если опаздываем на работу вызываем такси
  if (DateTime.now().millisecondsSinceEpoch >=
      timeToWork.millisecondsSinceEpoch) {
    orderTaxi();
  } else {
    walkToWork();
  }
}

void orderTaxi() {
  final isEnoughtMoneyOnCard = false;
  final isEnoughtMoneyOnPocket = true;
  if (isEnoughtMoneyOnCard || isEnoughtMoneyOnPocket) {
    // Вызываем такси и ждем
    waitTaxi(isEnoughtMoneyOnCard
        ? PaymentType.card
        : isEnoughtMoneyOnPocket
            ? PaymentType.money
            : PaymentType.card);
  } else {
    walkToWork();
  }
}

void waitTaxi(PaymentType payment) {
  for (var time = 0; time < 3600; time++) {
    // Ждем
  }
  // Такси приехало
  driveToOffice(payment);
}

void driveToOffice(PaymentType payment) {
  // Приехали
  var drivingTime = 60;
  while (drivingTime != 0) {
    drivingTime -= 1;
  }

  // Платим
  switch (payment) {
    case PaymentType.card:
      payByCard();
    case PaymentType.money:
      payByMoney();
  }

  // В зависимости от оставленного рейтинга либо даем чаевые либо нет
  switch (setFeedback()) {
    case Feedback.fine:
      setTips();
    case Feedback.notFine:
      break;
  }
}

void payByCard() {}
void payByMoney() {}

Feedback setFeedback() {
  return Feedback.fine;
}

void setTips() {}

void walkToWork() {}
