part of 'date_color_bloc.dart';

@immutable
abstract class DateColorState {
  final List? daysColors;
  final int? dayWeek;
  final int? daysInMonth;
  final List? daysCountColors;
  final List? weekDay;
  final List? colorsList;
  final List? typeList;

  const DateColorState({
    this.daysColors,
    this.dayWeek,
    this.daysInMonth,
    this.weekDay,
    this.colorsList,
    this.typeList,
    this.daysCountColors,
  });

  List<Object> get props => [];
}

class DateColorInitial extends DateColorState {}

class DateColorLoading extends DateColorState {}

class DateColorLoaded extends DateColorState {
  final List? daysColors;
  final List? colorsList;
  final List? daysCountColors;
  final List? weekDay;
  final List? typeList;
  final int? dayWeek;
  final int? daysInMonth;

  const DateColorLoaded({
    this.daysCountColors,
    this.daysColors,
    this.colorsList,
    this.dayWeek,
    this.typeList,
    this.daysInMonth,
    this.weekDay,
  }) : super(
          daysColors: daysColors,
          dayWeek: dayWeek,
          daysInMonth: daysInMonth,
          weekDay: weekDay,
          typeList: typeList,
          colorsList: colorsList,
          daysCountColors: daysCountColors,
        );
}

class DateColorError extends DateColorState {}
