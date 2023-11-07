import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:your_task_flutter/constant/color.dart';
import 'package:your_task_flutter/constant/date_time_constant.dart';
import 'package:your_task_flutter/constant/dimens.dart';
import 'package:your_task_flutter/constant/string.dart';
import 'package:your_task_flutter/data/model/todo_model.dart';
import 'package:your_task_flutter/data/vo/todo_vo.dart';

final TodoModel _todoModel = TodoModel();
List<ToDoVO>? todoList = _todoModel.getTaskList;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isVisible = true;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
        });
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar: BackdropAppBar(
        leading: const Icon(Icons.menu_outlined),
        actions: const [
          BackdropToggleButton(
            icon: AnimatedIcons.add_event,
          )
        ],
        backgroundColor: kPrimaryColor,
        title: const Text(kAppName),
      ),
      headerHeight: MediaQuery.of(context).size.height * 0.43,
      backLayerBackgroundColor: kPrimaryColor,
      backLayer: const CalendarView(),
      frontLayer: TaskSessionView(
        scrollController: _scrollController,
      ),
      floatingActionButton: _isVisible
          ? FloatingActionButton(
              backgroundColor: kPrimaryColor,
              onPressed: () {
                _addTaskDrawer(context).then((value) {
                  setState(() {
                    todoList = _todoModel.getTaskList;
                  });
                });
              },
              child: const Icon(Icons.add),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _isVisible
          ? BottomAppBar(
              notchMargin: kNotchMargin,
              color: kPrimaryColor,
              shape: const CircularNotchedRectangle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.checklist_rtl_outlined,
                        color: kSecondaryColor,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.event_note_outlined,
                        color: kSecondaryColor,
                      )),
                ],
              ),
            )
          : null,
    );
  }
}

Future<void> _addTaskDrawer(BuildContext context) {
  return showModalBottomSheet(
      isDismissible: false,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const BottomSheet();
      });
}

class BottomSheet extends StatefulWidget {
  const BottomSheet({
    super.key,
  });

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  String _taskName = "";
  String _description = "";
  String _selectTime = "";
  bool _isImportant = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(kSP15x),
              topRight: Radius.circular(kSP15x))),
      height: MediaQuery.of(context).size.height * 0.875,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: kSP10x, vertical: kSP10x),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close,
                  size: kCloseIconSize,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: TaskFieldWidget(
                maxLines: 1,
                taskName: kTaskName,
                alignLabelWithHint: false,
                onChangeValue: (value) {
                  _taskName = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: SizedBox(
                  height: 150,
                  child: TaskFieldWidget(
                    alignLabelWithHint: true,
                    taskName: kDescription,
                    maxLines: 5,
                    onChangeValue: (value) {
                      _description = value;
                    },
                  )),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: kSP10x, horizontal: kSP15x),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: kDateAndTimePickerHeight,
                      width: kDateAndTimePickerWidth,
                      decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(kSP25x)),
                      child: Text(kFormatSelectDate),
                    ),
                    GestureDetector(
                      onTap: () {
                        _showDatePicker(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: kDateAndTimePickerButtonWidth,
                        height: kDateAndTimePickerButtonHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kSP25x),
                          color: kPrimaryColor,
                        ),
                        child: const Text(
                          kSelectDate,
                          style: TextStyle(color: kPrimaryTextColor),
                        ),
                      ),
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: kSP10x, horizontal: kSP15x),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: kDateAndTimePickerHeight,
                    width: kDateAndTimePickerWidth,
                    decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(kSP25x)),
                    child: Text(_selectTime),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showTimePicker(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: kDateAndTimePickerButtonWidth,
                      height: kDateAndTimePickerButtonHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kSP25x),
                        color: kPrimaryColor,
                      ),
                      child: const Text(
                        kSelectTime,
                        style: TextStyle(color: kPrimaryTextColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: kSP5x),
                height: kIsImportantHeight,
                width: kIsImportantWidth,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(kSP25x)),
                child: Row(
                  children: [
                    const Text(
                      kIsImportant,
                      style: TextStyle(color: kPrimaryTextColor),
                    ),
                    Checkbox(
                        value: _isImportant,
                        onChanged: (value) {
                          setState(() {
                            _isImportant = value!;
                            print(_isImportant);
                          });
                        })
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _todoModel.saveTask(ToDoVO(_taskName, _description,
                          kFormatSelectDate, _selectTime, _isImportant));
                    });
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(
                          MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.width * 0.1)),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(kSP10x)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(kSP25x)),
                      )),
                  child: const Text(kSave),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showTimePicker(context) {
    showTimePicker(context: context, initialTime: kNowTime).then((value) {
      setState(() {
        _selectTime = value!.format(context);
      });
    });
  }

  void _showDatePicker(context) {
    showDatePicker(
            context: context,
            initialDate: kNowDate,
            firstDate: kStartDate,
            lastDate: kEndDate)
        .then((value) {
      setState(() {
        kFormatSelectDate = DateFormat('dd-MM-yyyy').format(value!);
      });
    });
  }
}

class TaskFieldWidget extends StatelessWidget {
  const TaskFieldWidget(
      {super.key,
      required this.onChangeValue,
      required this.taskName,
      required this.maxLines,
      required this.alignLabelWithHint});
  final Function(String) onChangeValue;
  final String taskName;
  final int maxLines;
  final bool alignLabelWithHint;

  @override
  Widget build(BuildContext context) {
    return TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
            labelText: taskName,
            alignLabelWithHint: alignLabelWithHint,
            labelStyle: const TextStyle(color: kPrimaryColor),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(kSP25x)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(kSP25x),
                borderSide: const BorderSide(color: kPrimaryColor))),
        onChanged: onChangeValue);
  }
}

class TaskSessionView extends StatefulWidget {
  const TaskSessionView({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  State<TaskSessionView> createState() => _TaskSessionViewState();
}

class _TaskSessionViewState extends State<TaskSessionView> {
  @override
  Widget build(BuildContext context) {
    return (todoList == null)
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            controller: widget.scrollController,
            itemCount: todoList!.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: const Key("task"),
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                    _todoModel.deleteTask(index);
                  }
                  if (direction == DismissDirection.endToStart) {}
                },
                background: Container(
                  color: kJobDoneDismissible,
                  alignment: Alignment.centerLeft,
                ),
                secondaryBackground: Container(
                  color: kJobRemoveDismissible,
                  alignment: Alignment.centerRight,
                ),
                child: TaskItemView(
                    taskName: todoList![index].taskName.toString(),
                    date: todoList![index].date.toString(),
                    time: todoList![index].time.toString(),
                    isImportant: todoList![index].isImportant),
              );
            });
  }
}

class TaskItemView extends StatelessWidget {
  const TaskItemView({
    super.key,
    required this.taskName,
    required this.date,
    required this.time,
    required this.isImportant,
  });
  final String taskName;
  final String date;
  final String time;
  final bool isImportant;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.symmetric(vertical: kSP10x, horizontal: kSP5x),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kSP10x)),
          child: ListTile(
            contentPadding: const EdgeInsets.all(kSP10x),
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: kSP10x),
              child: Text(taskName),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(date), Text(time)],
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: isImportant
                    ? const Icon(
                        Icons.star,
                        color: kIsImportantIconColor,
                      )
                    : const Icon(Icons.star_border_outlined)),
          ),
        ));
  }
}

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      kNowDate = day;
      kFormatDate = DateFormat('dd-MM-yyyy').format(kNowDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TableCalendar(
        headerStyle:
            const HeaderStyle(formatButtonVisible: false, titleCentered: true),
        calendarStyle: const CalendarStyle(
            tablePadding: EdgeInsets.symmetric(horizontal: 50),
            selectedDecoration: BoxDecoration(
                color: kCalendarSelectDateColor, shape: BoxShape.circle),
            weekendTextStyle: TextStyle(color: kCalendarWeekEndColor)),
        firstDay: kStartDate,
        lastDay: kEndDate,
        focusedDay: kNowDate,
        availableGestures: AvailableGestures.all,
        onDaySelected: _onDaySelected,
        selectedDayPredicate: (day) => isSameDay(day, kNowDate),
      ),
    );
  }
}
