import 'package:fliper_flutter_test/core/presentation/controllers/controller.dart';
import 'package:flutter/material.dart';

typedef WidgetBuilder<S> = Widget Function(BuildContext context, S state);

class ControllerBuilder<C extends Controller, S> extends BuilderBase<C, S> {
  final WidgetBuilder<S> builder;

  ControllerBuilder({
    Key key,
    @required this.builder,
    @required C controller,
  })  : assert(builder != null),
        super(key: key, controller: controller);

  @override
  Widget build(BuildContext context, S state) => builder(context, state);
}

abstract class BuilderBase<C extends Controller, S> extends StatefulWidget {
  final C controller;

  const BuilderBase({Key key, this.controller}) : super(key: key);

  Widget build(BuildContext context, S state);

  @override
  _BuilderBaseState createState() => _BuilderBaseState();
}

class _BuilderBaseState<C extends Controller, S>
    extends State<BuilderBase<C, S>> {
  C _controller;
  S _state;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller;
    _state = _controller.state;

    _controller.stateStream.listen((state) {
      setState(() => _state = state);
    });
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.build(context, _state),
    );
  }
}
