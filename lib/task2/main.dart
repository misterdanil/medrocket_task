import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medrocket_task/task2/blocs/survey_bloc.dart';
import 'package:medrocket_task/task2/survey_page.dart';
import 'package:medrocket_task/task2/repository/survey_mock_repository.dart';

void main() {
  runApp(SurveyApp());
}

class SurveyApp extends StatelessWidget {
  const SurveyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => SurveyMockRepository(),
      child: BlocProvider(
        create: (context) =>
            SurveyBloc(RepositoryProvider.of<SurveyMockRepository>(context)),
        child: MaterialApp(home: SurveyPage()),
      ),
    );
  }
}
