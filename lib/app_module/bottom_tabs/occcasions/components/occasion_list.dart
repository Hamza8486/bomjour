import 'package:bomjour/app_module/bottom_tabs/explore/components/explore_detail_view.dart';
import 'package:bomjour/app_module/bottom_tabs/occcasions/components/occasions_component.dart';
import 'package:flutter/material.dart';

class OccasionList extends StatelessWidget {
  const OccasionList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        primary: false,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:  EdgeInsets.symmetric(vertical:
            index==0?0:
            8),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ExploreDetailView()),
                );
              },
              child: occasionWidget(context: context,
                  image: "",
                  name: "Emily Johnson",
                  title: "Birthday Celebration",
                  date: "24 Jun, 2023"
              ),
            ),
          );
        });
  }
}
