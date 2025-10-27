import 'package:medrocket_task/task2/model/survey_model.dart';

abstract class SurveyState {
  SurveyEntity? _survey;

  SurveyState();

  SurveyState.survey(this._survey);

  SurveyEntity? get survey {
    return _survey;
  }
}

class SurveyNotFilledState extends SurveyState {}

class SurveyProcessingState extends SurveyState {
  SurveyProcessingState(SurveyEntity survey) : super.survey(survey) {
    if(survey.process == 0 || survey.process == 100) {
      throw ArgumentError("It's impossible to create survey processing state with 0 or 100 process");
    }
  }
}

class SurveyFilledState extends SurveyState {
  SurveyFilledState(SurveyEntity survey) : super.survey(survey) {
    if(survey.process < 100) {
      throw ArgumentError("It's impossible to create survey filled state with less than 100 process");
    }
  }
}