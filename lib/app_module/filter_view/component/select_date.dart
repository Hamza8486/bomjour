import 'package:bomjour/app_module/filter_view/controller/filter_controller.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_common_widgets/calender/adoptive_datetime_picker.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';


import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import '../../../utils/dark_theme_provider/dark_theme.dart';


class SelectDatePicker extends StatefulWidget {


  SelectDatePicker({super.key});


  @override
  State<SelectDatePicker> createState() => _SelectDatePickerState();
}

class _SelectDatePickerState extends State<SelectDatePicker> {



  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    final filterController = Provider.of<FilterController>(context);

    return  Directionality(
      textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
      child: DraggableScrollableSheet(
        initialChildSize:0.58,
        minChildSize: 0.58,
        maxChildSize:0.58,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius:  BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          child: Padding(
            padding:  EdgeInsets.only(top: 10),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: AppConfig(context).width*0.04),
              child: Column(
                children: [

                  SvgPicture.asset(AppImages.border,
                    color:themeChange.darkTheme?

                    Colors.white:Color(0xffE5E7EB),
                  ),
                  SizedBox(height:20),
                  AppText(text:AppLocalizations.of(context).selectDate,
                    size: 18,
                    color: Theme.of(context).primaryColor,
                    textAlign: themeChange.locale.languageCode  =="en"?TextAlign.left:TextAlign.right,

                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height:20),



            AdoptiveCalendar(

              initialDate: DateTime.now(),
                isOnlyDate:true,

              onChange: (dataTime) {
                print(dataTime.toString());
                print(DateFormat('dd MMM, yyyy').format(dataTime));
                filterController.updateDate(DateFormat('dd MMM,yyyy').format(dataTime));

                // onChange!(dataTime);
              },
            ),

                ],
              ),
            ),
          ),
        ),
      ),
    );


  }
}

