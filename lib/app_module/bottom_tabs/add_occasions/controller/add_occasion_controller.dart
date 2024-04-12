import 'package:bomjour/app_module/bottom_tabs/add_occasions/model/group_model.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AddOccasionController with ChangeNotifier {


  var addGroupList = <AddGroupModel>[];

  void addToGroupList(AddGroupModel item) {
    addGroupList.add(item);
    notifyListeners();
  }

  void removeFromGroupList(AddGroupModel item) {
    addGroupList.remove(item);
    notifyListeners();
  }
  TextEditingController searchController = TextEditingController();
  List<Contact> contacts = [];
  List<Contact> filteredContacts = [];

  Future<void> fetchContacts() async {
    bool isGranted = await Permission.contacts.status.isGranted;
    if (!isGranted) {
      isGranted = await Permission.contacts.request().isGranted;
    }
    if (isGranted) {
      contacts = await FastContacts.getAllContacts();
      filteredContacts = List.of(contacts);
      notifyListeners();
    }
  }

  void filterContacts(String query) {
    filteredContacts = contacts.where((contact) =>
        contact.displayName.toLowerCase().contains(query.toLowerCase())).toList();
    notifyListeners();
  }
  var selectRelationId="";
  updateRelationId(val){
    selectRelationId=val;
    notifyListeners();
  }


  var occasionFor = TextEditingController();
  var dateCon = TextEditingController();
  var relationCon = TextEditingController();
  var addFriendGroupCon = TextEditingController();
  var eventTypeCon = TextEditingController();
  var groupNameController = TextEditingController();


  var selectGroup=0;
  updateSelectedGroup(val){
    selectGroup=val;
    notifyListeners();
  }
}