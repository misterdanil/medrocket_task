import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medrocket_task/task2/blocs/survey_event.dart';
import 'package:medrocket_task/task2/blocs/survey_state.dart';
import 'package:medrocket_task/task2/model/survey_model.dart';
import 'package:medrocket_task/task2/repository/survey_repository.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  final SurveyRepository _surveyRepository;

  SurveyBloc(this._surveyRepository)
    : super(SurveyNotFilledState()) {
    on<FetchSurveyEvent>((event, emit) async {
      SurveyEntity? survey = await _surveyRepository
          .getSurvey();

      if (survey == null || survey.process == 0) {
        emit(SurveyNotFilledState());
      } else if (survey.process > 0 && survey.process < 100) {
        emit(SurveyProcessingState(survey));
      } else {
        emit(SurveyFilledState(survey));
      }
    });
  }
}
