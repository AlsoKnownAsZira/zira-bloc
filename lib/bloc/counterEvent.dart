// enum CounterEvent { increment, decrement }

class CounterEvent {
  CounterEvent(this.value);
  int value;
}

class IncrementEvent extends CounterEvent {
  IncrementEvent(int value) : super(value);
}

class DecrementEvent extends CounterEvent {
  DecrementEvent(int value) : super(value);
}
class DecrementByValueEvent extends CounterEvent {
  DecrementByValueEvent(int value) : super(value);
}
class IncrementByValueEvent extends CounterEvent {
  IncrementByValueEvent(int value) : super(value);
}

