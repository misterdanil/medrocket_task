import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medrocket_task/task2/blocs/survey_bloc.dart';
import 'package:medrocket_task/task2/blocs/survey_event.dart';
import 'package:medrocket_task/task2/blocs/survey_state.dart';
import 'package:medrocket_task/task2/model/survey_model.dart';
import 'package:medrocket_task/task2/task2_colors.dart';

class SurveyPage extends StatelessWidget {
  SurveyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyBloc, SurveyState>(
      builder: (context, state) => Scaffold(
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: ColoredBox(
                      color: Task2Colors.wrapperStatus,
                      child: Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: ColoredBox(
                            color: Task2Colors.status,
                            child: _buildProcessWidget(state),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Task2Colors.buttonBackground,
                      foregroundColor: Task2Colors.buttonForeground,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    onPressed: () {
                      BlocProvider.of<SurveyBloc>(
                        context,
                      ).add(FetchSurveyEvent());
                    },
                    child: const Text(
                      "Получить данные опросника",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProcessWidget(SurveyState state) {
    if (state is SurveyNotFilledState) {
      return const Text("Опросник ещё не начат", textAlign: TextAlign.center);
    } else if (state is SurveyProcessingState) {
      SurveyEntity survey = state.survey!;
      return Text(
        "Процесс заполнения опросника: ${survey.process}%",
        textAlign: TextAlign.center,
      );
    } else if (state is SurveyFilledState) {
      return const Text("Опросник заполнен", textAlign: TextAlign.center);
    } else {
      return const Text(
        "Нет данных о заполнении опросника",
        textAlign: TextAlign.center,
      );
    }
  }
}
