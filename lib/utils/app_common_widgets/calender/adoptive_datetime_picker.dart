import 'package:bomjour/utils/app_common_widgets/app_button.dart';
import 'package:bomjour/utils/app_common_widgets/calender/time_picker.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_padding/app_paddings.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'month_year_picker.dart';

class AdoptiveCalendar extends StatefulWidget {
  final DateTime initialDate;
  final Color? backgroundColor;
  final Color? fontColor;
  final Color? selectedColor;
  final Color? headingColor;
  final Color? barColor;
  final Color? barForegroundColor;
  final Color? iconColor;
  final int? minYear;
  final int? maxYear;
  final int minuteInterval;
  final bool use24hFormat;
  final bool isOnlyDate;
  final Widget? brandIcon;
  final Function(DateTime) onChange;
  final AdoptiveBackground backgroundEffects;
  const AdoptiveCalendar({
    super.key,
    required this.initialDate,
    this.backgroundColor,
    this.minYear,
    this.maxYear,
    this.fontColor,
    this.selectedColor,
    required this.onChange,
    this.headingColor,
    this.iconColor,
    this.isOnlyDate = false,
    this.barColor,
    this.barForegroundColor,
    this.minuteInterval = 1,
    this.use24hFormat = false,
    this.brandIcon,
    this.backgroundEffects = AdoptiveBackground.none,
  });
  @override
  State<AdoptiveCalendar> createState() => _AdoptiveCalendarState();
}

class _AdoptiveCalendarState extends State<AdoptiveCalendar> {
  DateTime? _selectedDate;
  DateTime? returnDate;
  bool? isYearSelected;
  bool? isTimeSelected;
  bool? isAM;
  List<String> monthNames = Constants.repeatMonthNames;
  @override
  void initState() {
    _selectedDate = widget.initialDate;
    isYearSelected = false;
    isTimeSelected = false;
    isAM = _selectedDate!.hour < 12;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;
    bool isPortrait = (orientation == Orientation.portrait) ? true : false;
    if (isPortrait) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
    Widget calendarBody = isYearSelected!
        ? SizedBox(
            height: screenHeight * (isPortrait ? 0.29 : 0.55),
            child: DatePicker(
              minYear: 1950,
              maxYear: widget.maxYear,
              initialDateTime: _selectedDate!,
              fontColor: widget.fontColor,
              onMonthYearChanged: (value) {
                _selectedDate = DateTime(
                    value.year,
                    value.month,
                    _selectedDate!.day,
                    _selectedDate!.hour,
                    _selectedDate!.minute);
                returnDate = _selectedDate;
                setState(() {});
              },
            ),
          )
        : isTimeSelected!
            ? SizedBox(
                height: screenHeight * (isPortrait ? 0.29 : 0.55),
                child: TimePicker(
                  initialDateTime: _selectedDate!,
                  minuteInterval: widget.minuteInterval,
                  use24hForm: widget.use24hFormat,
                  fontColor: widget.fontColor,
                  onDateTimeChanged: (value) {
                    _selectedDate = DateTime(
                        _selectedDate!.year,
                        _selectedDate!.month,
                        _selectedDate!.day,
                        value.hour,
                        value.minute);
                    isAM = _selectedDate!.hour < 12;
                    returnDate = _selectedDate;
                    setState(() {});
                  },
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: 7,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: Text(
                            Constants.weekDayName[index],
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color:Theme.of(context).primaryColor,),
                          ),
                        );
                      },
                    ),
      GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: 7 * 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.1,
          crossAxisCount: 7,
        ),
        itemBuilder: (context, index) {
          final day = index -
              DateTime(_selectedDate!.year, _selectedDate!.month, 1)
                  .weekday +
              2;
          return GestureDetector(
            onTap: () {
              if (day > 0 &&
                  day <=
                      DateTime(_selectedDate!.year, _selectedDate!.month + 1, 0)
                          .day) {
                setState(() {
                  _selectedDate = DateTime(
                    _selectedDate!.year,
                    _selectedDate!.month,
                    day,
                    _selectedDate!.hour,
                    _selectedDate!.minute,
                  );
                  returnDate = _selectedDate;
                });
              }
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: _isSelectedDay(day)
                    ? AppLightColors.primary_color
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                day <= 0 ||
                    day >
                        DateTime(_selectedDate!.year, _selectedDate!.month + 1, 0)
                            .day
                    ? ''
                    : '$day',
                style: GoogleFonts.poppins(
                  fontWeight: _isSelectedDay(day) ? FontWeight.w400 : FontWeight.normal,
                  fontSize: 14,
                  color: _isSelectedDay(day)
                      ? AppLightColors.white_color
                      : (day == DateTime.now().day
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColor),
                ),
              ),
            ),
          );
        },
      )


      ],
                ),
              );
    List<Widget> topArrowBody = [
      Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              isTimeSelected = false;
              isYearSelected = !isYearSelected!;
              setState(() {});
            },
            child: Text(
              "${monthNames[_selectedDate!.month - 1]} ${_selectedDate!.year}",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color:  Theme.of(context).primaryColor,),
            ),
          ),

          Expanded(child: Container()),
          if (!isYearSelected!) ...[
            GestureDetector(
              onTap: (){
                setState(() {
                  _selectedDate =
                      _selectedDate?.subtract(const Duration(days: 30));
                  returnDate = _selectedDate;
                });
              },
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: widget.iconColor ??Theme.of(context).primaryColor,
                size: 15,
              ),
            ),
            SizedBox(width: 4),

            GestureDetector(
              onTap: (){
                setState(() {
                  _selectedDate = _selectedDate?.add(const Duration(days: 30));
                  returnDate = _selectedDate;
                });
              },
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: widget.iconColor ?? AppLightColors.primary_color,
                size: 15,
              ),
            ),
          ]
        ],
      ),
      if (isPortrait)
        const SizedBox(
          height: 3,
        ),
    ];
    List<Widget> pickTimeBody = widget.isOnlyDate
        ? []
        : [
            if (widget.brandIcon != null)
              Center(
                child: SizedBox(
                    height: isPortrait ? 35 : 45, child: widget.brandIcon!),
              ),
            if (widget.brandIcon == null)
              Text(
                "Time",
                style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: widget.headingColor),
              ),
            if (isPortrait) Expanded(child: Container()),
            if (!isPortrait) Container(height: screenHeight * 0.1),
            GestureDetector(
              onTap: () {
                isTimeSelected = !isTimeSelected!;
                isYearSelected = false;
                setState(() {});
              },
              child: Container(
                height: 40,
                width: screenWidth * (isPortrait ? 0.25 : 0.3),
                decoration: BoxDecoration(
                    color: (widget.barColor ?? AppLightColors.primary_color),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        _selectedDate!.format12Hour(
                            use24HoursFormat: widget.use24hFormat),
                        style: GoogleFonts.outfit(
                            color: widget.barColor != null
                                ? widget.fontColor
                                : null,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            letterSpacing: 3),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ...[
              if (isPortrait) SizedBox(width: screenWidth * 0.02),
              if (!isPortrait) Container(height: screenHeight * 0.1),
              if (!widget.use24hFormat)
                Container(
                  height: 40,
                  width: screenWidth * (isPortrait ? 0.32 : 0.3),
                  decoration: BoxDecoration(
                      color: widget.barColor ?? AppLightColors.primary_color,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: isTimeSelected!
                                  ? null
                                  : () {
                                      isAM = !isAM!;
                                      _selectedDate = DateTime(
                                          _selectedDate!.year,
                                          _selectedDate!.month,
                                          _selectedDate!.day,
                                          isAM!
                                              ? _selectedDate!.hour % 12 == 0
                                                  ? 12
                                                  : _selectedDate!.hour % 12
                                              : _selectedDate!.hour + 12,
                                          _selectedDate!.minute);
                                      returnDate = _selectedDate;
                                      setState(() {});
                                    },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: isAM!
                                        ? widget.barForegroundColor ??
                                        AppLightColors.primary_color
                                        : null,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      "AM",
                                      style: GoogleFonts.outfit(
                                        color: widget.barForegroundColor != null
                                            ? widget.fontColor
                                            : isAM!
                                                ? Colors.white
                                                : Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          Expanded(
                            child: GestureDetector(
                              onTap: isTimeSelected!
                                  ? null
                                  : () {
                                      isAM = !isAM!;
                                      _selectedDate = DateTime(
                                          _selectedDate!.year,
                                          _selectedDate!.month,
                                          _selectedDate!.day,
                                          isAM!
                                              ? _selectedDate!.hour % 12 == 0
                                                  ? 12
                                                  : _selectedDate!.hour % 12
                                              : _selectedDate!.hour + 12,
                                          _selectedDate!.minute);
                                      returnDate = _selectedDate;
                                      setState(() {});
                                    },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: !isAM!
                                        ? widget.barForegroundColor ??
                                            AppLightColors.primary_color
                                        : null,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      "PM",
                                      style: GoogleFonts.outfit(
                                        color: widget.barForegroundColor != null
                                            ? widget.fontColor
                                            : !isAM!
                                                ?Colors.white
                                            : Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ]
          ];
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
        Navigator.pop(context, returnDate);
      },
      child: Container(
        decoration: widget.backgroundEffects.imageUrl.isNotEmpty
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.backgroundEffects.imageUrl)),
              )
            : BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 15.0,
          ),
          child: isPortrait
              ? SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...topArrowBody,
                      calendarBody,

                      widget.isOnlyDate
                          ? Container()
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: pickTimeBody),
                      Padding(
                        padding: AppPaddings.onlyPadding(top: 0),
                        child: Row(
                          children: [

                            Expanded(
                              child: AppButton(
                                  buttonName: AppLocalizations.of(context).select,
                                  buttonRadius: BorderRadius.circular(24),

                                  onTap: () {
                                    widget.onChange(_selectedDate!);
                                    Navigator.pop(context);


                                    // print(_selectedDate);
                                  }),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : SizedBox(
                  width: screenWidth * 0.7,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...topArrowBody,
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(child: calendarBody),
                            Expanded(
                                child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: pickTimeBody,
                              ),
                            )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  bool _isSelectedDay(int day) {
    return _selectedDate!.day == day;
  }
}

enum AdoptiveBackground {
  christmas,
  winter,
  snowFall,
  summer,
  halloween,
  smokyLeaves,
  none
}

extension DateTimeExtension on DateTime {
  String format12Hour({required bool use24HoursFormat}) {
    int hour12 = use24HoursFormat ? hour : (hour % 12 == 0 ? 12 : hour % 12);
    String hourString = hour12 < 10 ? '0$hour12' : '$hour12';
    String minuteString = minute < 10 ? '0$minute' : '$minute';
    return '$hourString:$minuteString';
  }
}
