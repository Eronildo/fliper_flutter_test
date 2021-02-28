import 'dart:async';

abstract class ControllerBase<Event, State> {
  State _state;

  Stream<State> get stateStream;

  State get state => _state;
  set state(value) => _state = value;

  ControllerBase(this._state);

  void add(Event event);

  void close();
}

abstract class Controller<Event, State> extends ControllerBase<Event, State> {
  final _eventController = StreamController<Event>.broadcast();
  final _stateController = StreamController<State>.broadcast();

  Controller(State initialState) : super(initialState) {
    _stateController.add(initialState);
    _eventController.stream.listen((event) {
      _stateController.addStream(changeStateByEvent(event));
    });
    _stateController.stream.listen((state) {
      this.state = state;
    });
  }

  Stream<State> changeStateByEvent(Event event);

  @override
  Stream<State> get stateStream => _stateController.stream;

  @override
  void add(Event event) {
    _eventController.add(event);
  }

  @override
  void close() {
    _eventController.close();
    _stateController.close();
  }
}
