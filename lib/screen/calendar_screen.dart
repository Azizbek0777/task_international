import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_international/style/app_style.dart';

import '../bloc/date_color/date_color_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DateColorBloc>().add(DateColorEvent());
  }

  int? type;
  String? color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: Text("Type:${type ?? " "},  Color:${color ?? " "}"),
        elevation: 0,
      ),
      body: BlocBuilder<DateColorBloc, DateColorState>(
        builder: (context, state) {
          if (state is DateColorLoaded) {
            final dayWeek = state.dayWeek!;
            final daysInMonth = state.daysInMonth;
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                crossAxisSpacing: 8,
                mainAxisSpacing: 4,
              ),
              itemCount: 42,
              itemBuilder: (BuildContext context, int index) {
                return index < 7
                    ? Container(
                        margin: const EdgeInsets.only(right: 5, left: 5),
                        child: Text(
                          state.weekDay?[index],
                          style: index == 6 ? AppStyle.weekDayNameRed : AppStyle.weekDayName,
                        ),
                      )
                    : index - 6 >= dayWeek && index - 5 - dayWeek <= daysInMonth!
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                color = state.colorsList?[index - 6 - dayWeek];
                                type = state.typeList?[index - 6 - dayWeek];
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(state.daysColors![index - 6 - dayWeek]),
                                borderRadius: BorderRadius.circular(80),
                              ),
                              child: Center(
                                child: Text(
                                  "${index - 5 - dayWeek}",
                                  style: index % 7 == 6
                                      ? AppStyle.calendarCountRed
                                      : state.daysCountColors?[index - 6 - dayWeek]
                                          ? AppStyle.calendarCountBlack
                                          : AppStyle.calendarCountWhite,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox();
              },
            );
          } else if (state is DateColorLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
