import 'package:bomjour/utils/app_themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../app_common_widgets/app_text.dart';
import 'localization.dart';


showSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor:Theme.of(context).scaffoldBackgroundColor,
        content:    AppText(
          text:message,
          size: 12,
          color:  Theme.of(context).primaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
}

hideKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}


Future<bool> showExit({context, onTap}) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
         // backgroundColor: AppLightColors.primary_color,
          content: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            height: 95,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Do you want to logout?",
                  style:
                  GoogleFonts.poppins(
                    textStyle:
                  TextStyle(
                      color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500
                  ),
                )),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          child: Text("No", style:
                          GoogleFonts.poppins(
                              textStyle:  TextStyle(color: AppLightColors.black_color,
                                  fontWeight: FontWeight.w400
                              )),
                        ))),
                     SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppLightColors.primary_color),
                        child: Text(
                          "Yes",
                          style:
                          GoogleFonts.poppins(
                            textStyle:
                          TextStyle(color: AppLightColors.white_color,
                          fontWeight: FontWeight.w500
                          )),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}