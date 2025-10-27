import 'package:medrocket_task/task2/model/survey_model.dart';
import 'package:medrocket_task/task2/repository/survey_repository.dart';

class SurveyMockRepository implements SurveyRepository {
  int _currentProcess = 0;

  @override
  Future<SurveyEntity?> getSurvey() async {
    if(_currentProcess == 100) {
      _currentProcess = 0;
      return null;
    }

    _currentProcess += 25;

    return SurveyEntity(_currentProcess);
  }
}