import 'package:fliper_flutter_test/core/presentation/views/components/builders/controller_builder.dart';
import 'package:fliper_flutter_test/core/presentation/views/components/providers/provider.dart';
import 'package:fliper_flutter_test/features/wealth_summary/presentation/controllers/summary_controller.dart';
import 'package:fliper_flutter_test/features/wealth_summary/presentation/controllers/summary_event.dart';
import 'package:fliper_flutter_test/features/wealth_summary/presentation/controllers/summary_state.dart';
import 'package:flutter/material.dart';

class HomeGreetings extends StatelessWidget {
  final String greetingsText;
  final String userName;

  const HomeGreetings({
    Key key,
    this.greetingsText = 'Olá',
    this.userName = 'Fulano',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _getAppIcon(),
        _getGreetingsWidget(context),
        Spacer(),
        _getShowHideValuesButton(context),
      ],
    );
  }

  Widget _getAppIcon() => FlutterLogo(size: 48.0);

  Widget _getGreetingsWidget(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              greetingsText,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              userName,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      );

  Widget _getShowHideValuesButton(BuildContext context) {
    final summaryController = Provider.of<SummaryController>(context);
    return ClipOval(
      child: Material(
        color: Theme.of(context).secondaryHeaderColor,
        child: ControllerBuilder<SummaryController, SummaryState>(
          controller: summaryController,
          builder: (context, state) {
            var isHidden = false;
            final isLoadedState = state is LoadedState;
            if (state is LoadedState) {
              isHidden = state.model.isValuesHidden;
            }
            return InkWell(
              child: SizedBox(
                width: 35,
                height: 35,
                child: Icon(
                  isHidden
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: isLoadedState ? Colors.white : Colors.white30,
                ),
              ),
              onTap: isLoadedState
                  ? () {
                      summaryController.add(ShowHideSummaryEvent());
                    }
                  : null,
            );
          },
        ),
      ),
    );
  }
}
