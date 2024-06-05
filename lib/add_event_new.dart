import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_admin_panel/components/app_color/app_colors.dart';
import 'package:taxi_admin_panel/components/app_color/round_button.dart';
import 'package:taxi_admin_panel/components/textfields.dart';

class Add_Event_Page extends StatelessWidget {
   Add_Event_Page({super.key});
  TextEditingController eventController = TextEditingController();
     TextEditingController expectedNumberController = TextEditingController();
     TextEditingController locationController = TextEditingController();
     TextEditingController eventTime = TextEditingController();
     TextEditingController eventDate = TextEditingController();

     final adminPanelEvents = FirebaseFirestore.instance.collection("admin_panel_events");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        title: Center(child: Text("ADD EVENT YOU KNOW",style: TextStyle(color: AppColors.whiteColor),)),
      ),
      body: Container(
        child: Column(
          children: [
            MyTextField(hintText: "e.g Football match", labelText: "Event Name", controller: eventController),
            MyTextField(hintText: "e.g 25", labelText: "Expected passengers", controller: expectedNumberController),
            MyTextField(hintText: "e.g 7:00 PM", labelText: "Event end time", controller: eventTime),
            MyTextField(hintText: "e.g 24/12/2024", labelText: "Event date", controller: eventDate),
            
            MyTextField(hintText: "e.g ", labelText: "Location", controller: locationController),
            const SizedBox(height: 20,),
            MyButton(ontap: (){
              adminPanelEvents.add({
                "event_name" : eventController.text,
                "time" : DateTime.now().toString(),
                "expected_passengers" : expectedNumberController.text,
                "location" : locationController.text,
                "event_date" : eventDate.text
                
              });
              Get.snackbar("Event Added", "Successfully");


            }, text: "Add Event")
            
          ],
        ),
      ),
    );
  }
}