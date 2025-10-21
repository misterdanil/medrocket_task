import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medrocket_task/task2/blocs/survey_event.dart';
import 'package:medrocket_task/task2/blocs/survey_state.dart';
import 'package:medrocket_task/task2/model/survey_model.dart';
import 'package:medrocket_task/task2/repository/survey_repository.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  final SurveyRepository _questionnaireRepository;

  SurveyBloc(this._questionnaireRepository)
    : super(SurveyNotFilledState()) {
    on<FetchSurveyEvent>((event, emit) async {
      SurveyEntity? questionnaire = await _questionnaireRepository
          .getSurvey();

      if (questionnaire == null || questionnaire.process == 0) {
        emit(SurveyNotFilledState());
      } else if (questionnaire.process > 0 && questionnaire.process < 100) {
        emit(SurveyProcessingState(questionnaire));
      } else {
        emit(SurveyFilledState(questionnaire));
      }
    });
  }
}
