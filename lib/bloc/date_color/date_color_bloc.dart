import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:task_international/repository/repository.dart';
import 'package:task_international/response/colors_response.dart';
import 'package:task_international/response/date_response.dart';

part 'date_color_event.dart';

part 'date_color_state.dart';

class DateColorBloc extends Bloc<DateEvent, DateColorState> {
  DateColorBloc() : super(DateColorInitial()) {
    Repository repository = Repository();

    on<DateColorEvent>((event, emit) async {
      int dayWeek = 0;
      List weekDay = ["Mon", "Tue", "Wen", "Thu", "Fri", "Sut", "Sun"];
      List typeList = [];
      List daysColors = [];
      List daysCountColors = [];
      List colorsList = [];
      emit(DateColorLoading());
      await repository.getColors().then((value) async {
        List<ColorsResponse> colorTypeList = (value?.data as List).map((e) => ColorsResponse.fromJson(e)).toList();
        await repository.getDate().then((value) {
          DateResponse dateResponse = DateResponse.fromJson((value?.data));
          List<Map<String, dynamic>> dateList = dateResponse.toJson()['days'];
          dayWeek = DateTime(dateResponse.year!, int.parse(dateResponse.month!), 1).weekday;
          final daysInMonth = DateUtils.getDaysInMonth(dateResponse.year!, int.parse(dateResponse.month!));
          Map<dynamic, dynamic> typeColorMapping = {};
          for (int i = 0; i < colorTypeList.length; i++) {
            typeColorMapping.addAll({colorTypeList[i].type: colorTypeList[i].color});
          }
          String getColor(int day) {
            Map<String, dynamic>? entry = dateList.firstWhere((entry) => entry["day"] == day, orElse: () => {});
            int entryType = entry.containsKey("type") ? entry["type"] : 0;
            typeList.add(entryType);
            return typeColorMapping[entryType] ?? "#FFFFFF";
          }

          for (int day = 1; day <= daysInMonth; day++) {
            String color = getColor(day);
            colorsList.add(color);
            daysColors.add(int.parse("0xFF${color.replaceAll("#", "")}"));
            daysCountColors.add(int.parse("0xFF${color.replaceAll("#", "")}") == 4294112501 ||
                    int.parse("0xFF${color.replaceAll("#", "")}") == 4294967295 ||
                    int.parse("0xFF${color.replaceAll("#", "")}") == 4294441466
                ? true
                : false);
          }
          emit(DateColorLoaded(daysColors: daysColors, dayWeek: dayWeek, daysInMonth: daysInMonth, daysCountColors: daysCountColors, weekDay: weekDay, colorsList: colorsList, typeList: typeList));
        });
      });
    });
  }
}
