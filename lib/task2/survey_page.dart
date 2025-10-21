import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medrocket_task/task2/blocs/survey_bloc.dart';
import 'package:medrocket_task/task2/blocs/survey_event.dart';
import 'package:medrocket_task/task2/blocs/survey_state.dart';
import 'package:medrocket_task/task2/model/survey_model.dart';

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
                      color: Colors.black45,
                      child: Center(
                        child: ColoredBox(
                          color: Colors.white12,
                          child: _buildProcessWidget(state),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[500],
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      BlocProvider.of<SurveyBloc>(
                        context,
                      ).add(FetchSurveyEvent());
                    },
                    child: Text(
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
      return Text("Опросник ещё не начат", textAlign: TextAlign.center);
    } else if (state is SurveyProcessingState) {
      SurveyEntity questionnaire = state.survey!;
      return Text(
        "Процесс заполнения опросника: ${questionnaire.process}%",
        textAlign: TextAlign.center,
      );
    } else if (state is SurveyFilledState) {
      return Text("Опросник заполнен", textAlign: TextAlign.center);
    } else {
      return Text(
        "Нет данных о заполнении опросника",
        textAlign: TextAlign.center,
      );
    }
  }
}
