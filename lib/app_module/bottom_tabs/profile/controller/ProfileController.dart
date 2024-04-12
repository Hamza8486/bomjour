

import 'package:flutter/material.dart';


class ProfileController extends ChangeNotifier {






  var first_nameController = TextEditingController();
  var last_nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  bool isEmail = false;
  bool isEmailValidate = true;


  var toolTip = GlobalKey<TooltipState>();
  final formKey = GlobalKey<FormState>();


}
