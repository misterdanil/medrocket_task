import 'package:medrocket_task/task2/model/survey_model.dart';

abstract class SurveyRepository {
  Future<SurveyEntity?> getSurvey();
}