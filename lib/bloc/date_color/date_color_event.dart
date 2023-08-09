part of 'date_color_bloc.dart';

@immutable
abstract class DateEvent extends Emittable {}

class DateColorEvent extends DateEvent {
  @override
  void emit(Object? state) {
    // TODO: implement emit
  }
}

