import 'package:flutter/material.dart';
import 'package:medrocket_task/task1/clinic.dart';
import 'package:medrocket_task/task1/doctor.dart';
import 'package:medrocket_task/task1/header.dart';
import 'package:medrocket_task/task1/model/clinic_entity.dart';
import 'package:medrocket_task/task1/patient.dart';
import 'package:medrocket_task/task1/receive_date.dart';
import 'package:medrocket_task/task1/task1_colors.dart';
import 'package:medrocket_task/task1/task1_images.dart';

void main() {
  runApp(
    NewDocument(
      name: "Ирина",
      receiveDate: DateTime(2025, 5, 22, 16),
      clinic: ClinicEntity(
        name: "Фомина",
        address: "Бульвар Перервинский, д. 4",
      ),
      doctor: "Стоматолог",
    ),
  );
}

class NewDocument extends StatelessWidget {
  final String name;
  final DateTime receiveDate;
  final ClinicEntity clinic;
  final String doctor;

  const NewDocument({
    Key? key,
    required this.name,
    required this.receiveDate,
    required this.clinic,
    required this.doctor,
  }) : super(key: key);

  static const double _rootPadding = 16.0;
  static const double _payloadVerticalMargin = 25;
  static const double _buttonRadius = 10;
  static const double _buttonFontSize = 15;
  static const FontWeight _buttonFontWeight = FontWeight.w600;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Task1Colors.background,
        appBar: AppBar(
          // Можно было бы использовать leading для icon, но там отступ слева неконтролируемый. Можно предположить, что там примерно 16,
          // но лучше уж указать точно
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: _rootPadding),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    // some back logic
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 32),
                const TextHeader(textPage: "Новый документ"),
              ],
            ),
          ),
          titleSpacing: 0,
          backgroundColor: Task1Colors.headerBackground,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: SizedBox(
              height: 1,
              width: double.infinity,
              child: ColoredBox(color: Task1Colors.headerBorder),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: _rootPadding),
          child: Column(
            children: [
              const SizedBox(height: _rootPadding),
              SizedBox(
                width: double.infinity,
                child: Image.asset(Task1Images.newDocument, fit: BoxFit.fill),
              ),
              const SizedBox(height: _rootPadding),
              Column(
                children: [
                  const SizedBox(height: _payloadVerticalMargin),
                  Patient(name: name),
                  const SizedBox(height: _payloadVerticalMargin),
                  ReceiveDate(receiveDate),
                  const SizedBox(height: 15),
                  Clinic(clinic: clinic),
                  const SizedBox(height: _payloadVerticalMargin),
                  Doctor(doctor),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                height: 130,
                decoration: BoxDecoration(
                  color: Task1Colors.info,
                  border: Border.all(color: Colors.transparent, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      child: const Text(
                        "Клиника прислала документ после приёма. Чтобы добавить его в медкарту и " +
                            "посмотреть содержание, нужно будет указать дату рождения пациента. Это проверка для безопасности данных.",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Positioned(
                      right: -10,
                      bottom: -15,
                      child: Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Task1Colors.infoIcon,
                            width: 4,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "\u{1D456}",
                            style: TextStyle(
                              fontSize: 26,
                              fontFamily: "Times New Roman",
                              color: Task1Colors.infoIcon,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // some add logic
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(_buttonRadius),
                          ),
                          backgroundColor: Task1Colors.addToCardButton,
                          foregroundColor: Task1Colors.addToCardButtonText,
                          textStyle: const TextStyle(
                            fontSize: _buttonFontSize,
                            fontWeight: _buttonFontWeight,
                          ),
                        ),
                        child: const Text('Добавить в медкарту'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // some remove logic
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(_buttonRadius),
                          ),
                          backgroundColor: Task1Colors.removeButton,
                          foregroundColor: Task1Colors.removeButtonText,
                          textStyle: const TextStyle(
                            fontSize: _buttonFontSize,
                            fontWeight: _buttonFontWeight,
                          ),
                        ),
                        child: const Text('Удалить'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
