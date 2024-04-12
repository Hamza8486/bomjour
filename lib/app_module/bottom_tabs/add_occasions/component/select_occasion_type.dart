import 'package:bomjour/app_module/bottom_tabs/add_occasions/component/add_contact_list.dart';
import 'package:bomjour/app_module/bottom_tabs/add_occasions/component/create_group.dart';
import 'package:bomjour/app_module/bottom_tabs/add_occasions/view/add_occasion.dart';
import 'package:bomjour/utils/app_common_widgets/app_text.dart';
import 'package:bomjour/utils/app_constants/app_config.dart';
import 'package:bomjour/utils/app_constants/app_images.dart';
import 'package:bomjour/utils/app_constants/localization.dart';
import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:bomjour/utils/dark_theme_provider/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';
import 'dart:ui' as ui;




class SelectOccasionType extends StatelessWidget {
   SelectOccasionType({super.key});

  List optionList=[
    "Add Event",
    "Add Occasions",
    "Create a Group"

  ];

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeLocalizationProvider>(context);
    var localization = AppLocalizations.of(context);


    return  Directionality(

      textDirection:     themeChange.locale.languageCode  =="en"? ui.TextDirection.ltr: ui.TextDirection.rtl,
      child: DraggableScrollableSheet(
        initialChildSize: 0.45,
        minChildSize:0.45,
        maxChildSize: 0.45,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius:  BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          child: Padding(
            padding:  EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:AppConfig(context).height*0.01 ,),
                Center(child: SvgPicture.asset(AppImages.border)),
                SizedBox(height:24 ,),
                Center(
                  child: AppText(text: localization.select_option
                    ,
                    size: 18,
                    color: Theme.of(context).primaryColor,
                    textAlign: themeChange.locale.languageCode  =="en"?TextAlign.left:TextAlign.right,

                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height:28 ,),
                for(int i=0; i<3; i++)
                  GestureDetector(
                    onTap: (){
                      if(i==0){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  AddOccasion()),
                        );
                      }
                      else if(i==1){

                      }
                      else{
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  CreateGroup()),
                        );
                      }

                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 24),
                            child: AppText(text:
                              i==0?localization.add_event:
                              i==1?localization.add_occ:
                             localization.create_group
                              ,
                              size: 16,
                              color: Theme.of(context).primaryColor,
                              textAlign: themeChange.locale.languageCode  =="en"?TextAlign.left:TextAlign.right,

                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height:24 ,),
                          Divider(color:
                          themeChange.darkTheme?AppLightColors.black_color:
                          AppLightColors.dividerColor,),
                          SizedBox(height:24 ,),
                        ],
                      ),
                    ),
                  ),


              ],
            ),
          ),
        ),
      ),
    );


  }
}



