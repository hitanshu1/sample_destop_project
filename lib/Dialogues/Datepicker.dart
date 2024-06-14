part of './Dialogues.dart';

/// A dialog for selecting a date using a custom date picker.
class Datepickerdialogue extends StatefulWidget {
  /// Function that will be called when a date is selected. The selected [DateTime] is passed as a parameter.
  final Function(DateTime) onSelected;

  /// The initially selected date in the date picker.
  final DateTime? selectedDateTime;

  /// The minimum number of years to be shown from the current year in the date picker.
  final int minYears;

  /// The maximum number of years to be shown from the current year in the date picker.
  final int maxYears;

  /// Constructor for the Datepickerdialogue class.
  ///
  /// [onSelected] is a required callback function that will be invoked when a date is selected.
  /// [selectedDateTime] is the initially selected date in the date picker. It can be null if no date is initially selected.
  /// [minYears] and [maxYears] define the range of years to be shown in the date picker.
  /// Allow to pick a year
  final bool allowYear;

  ///Allow to pick a month
  final bool allowMonth;

  ///Allow to pick a day
  final bool allowDay;

  ///Constructor
  const Datepickerdialogue({
    super.key,
    required this.onSelected,
    required this.selectedDateTime,
    required this.minYears,
    required this.maxYears,
    required this.allowYear,
    required this.allowMonth,
    required this.allowDay,
  });

  @override
  State<Datepickerdialogue> createState() => _DatepickerdialogueState();
}

class _DatepickerdialogueState extends State<Datepickerdialogue> {
  final ScrollController yearScrollController = ScrollController();

  /// The currently selected date in the date picker.
  DateTime? selectedDateTime;

  @override
  void initState() {
    selectedDateTime = widget.selectedDateTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialoguer(
        title: 'Select a date',
        height: 520,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              yearsBuilder(),
              monthsBuilder(),
              daysBuilder(),
            ],
          ),
        ));
  }

  Widget yearsBuilder() {
    final int thisYear = DateTime.now().year;
    final List<int> years = <int>[];

    ///Add no of years from this year
    for (int i = widget.maxYears; i > 0; i--) {
      years.add(thisYear + i);
    }

    years.add(thisYear);

    for (int i = 1; i < widget.minYears; i++) {
      years.add(thisYear - i);
    }

    return Expanded(
      child: Cardd(
        // outterPadding: EdgeInsets.zero,
        // opacity: 0.075,
        color: Colors.blueGrey,
        child: GridView.builder(
          padding: EdgeInsets.zero,
          controller: yearScrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 2.25,
          ),
          itemCount: years.length,
          itemBuilder: (BuildContext context, int index) {
            final int year = years[index];
            final bool isSelected = selectedDateTime?.year == year;
            return Button(
              radius: 4,
              padding: const EdgeInsets.all(2.5),
              // icon: isSelected ? Icons.check : null,
              isOutlined: !isSelected,
              text: year,
              elevation: 0,
              isVoid: true,
              buttonColor: thisYear == year || isSelected ? Colors.blueGrey : Colors.grey,
              onPressed: () {
                if (widget.allowMonth) {
                  setState(() {
                    if (selectedDateTime == null) {
                      selectedDateTime ??= DateTime(year);
                    } else {
                      selectedDateTime = selectedDateTime?.copyWith(year: year);
                    }
                  });
                } else {
                  widget.onSelected(selectedDateTime!);
                  Widgets.pop(context);
                }
              },
            );
          },
        ),
      ),
    );
  }

  Widget monthsBuilder() {
    return Cardd(
      // outterPadding: EdgeInsets.zero,
      // opacity: 0.075,
      color: Colors.green,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          childAspectRatio: 2.25,
        ),
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          final int month = index + 1;
          final bool isSelected = selectedDateTime?.month == month;

          return Button(
            isOutlined: !isSelected,
            text: month.toMonthName,
            elevation: 0,
            isVoid: true,
            buttonColor: isSelected ? Colors.green : Colors.grey,
            onPressed: () {
              if (widget.allowDay) {
                setState(() {
                  if (selectedDateTime == null) {
                    selectedDateTime ??= DateTime(0, month);
                  } else {
                    selectedDateTime = selectedDateTime?.copyWith(month: month);
                  }
                });
              } else {
                widget.onSelected(selectedDateTime!);
                Widgets.pop(context);
              }
            },
          );
        },
      ),
    );
  }


  Widget daysBuilder() {
    int days = 31;
    final int mtn = selectedDateTime?.month ?? 0;
    if (mtn == 2) {
      days = (selectedDateTime?.year ?? 0).isLeapYear ? 29 : 28;
    } else if (<int>[4, 6, 9, 11].contains(mtn)) {
      days = 30;
    }
    return Expanded(
      child: Cardd(
        // outterPadding: EdgeInsets.zero,
        color: Colors.blue.withOpacity(0.075),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 2,
          ),
          itemCount: days,
          itemBuilder: (BuildContext context, int index) {
            final int day = index + 1;
            final bool isSelected = selectedDateTime?.day == day;
            return Button(
              radius: 4,
              isVoid: true,
              text: day,
              isOutlined: !isSelected,
              elevation: 0,
              buttonColor: Colors.blue,
              onPressed: () async {
                setState(() {
                  if (selectedDateTime == null) {
                    selectedDateTime = DateTime.now().copyWith(day: day);
                  } else {
                    selectedDateTime = selectedDateTime!.copyWith(day: day);
                  }
                });
                await Widgets.wait(100);
                widget.onSelected(selectedDateTime!);
                Widgets.pop(context);
              },
            );
          },
        ),
      ),
    );
  }

  
}
