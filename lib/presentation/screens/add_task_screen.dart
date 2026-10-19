import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:task_manager/logic/task_controller.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  final TextEditingController _taskTitleController=TextEditingController();
  final TaskController _taskController = TaskController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Container(

  width: double.infinity,
  height: double.infinity,
  decoration: BoxDecoration(
    gradient: LinearGradient(
        colors: [
          Color(0xFF7D34A5),
          Color(0xFF316E3F),
        ],
      stops: [0.36,0.84],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  child: SafeArea(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               IconButton(onPressed: (){
                 Navigator.pop(context);
               },
                   icon: Icon(
                     Icons.arrow_back_ios_new,
                     color: Colors.black,
                     size: 30,
                   ),
               ),

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                  IconButton(onPressed: (){},
                   icon: Icon(
                     Icons.search,
                     color: Colors.black,
                     size: 30,
                   ),
                 ),

               SizedBox(width: 45),
               IconButton(
                 onPressed: (){},
                 icon: Icon(
                   Icons.notifications_none,
                   color: Colors.black,
                   size: 30,
                 ),
               ),
                 ],
               ),
             ],
               ),
            SizedBox(height: 47),
            Text(
              "ADD TASK",
              style: GoogleFonts.poppins(
                color: Color(0xFFFFFFFF),
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 79),
            Container(
              width: double.infinity,
              height: 57,
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFFD9D9D9),

              ),
              child: TextField(
                controller: _taskTitleController,
                style: GoogleFonts.poppins(
                  color: Colors.black, // ইউজার যা লিখবে তার কালার কালো হবে
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  hintText: "write task",
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.black38, // ফিকে লেখার কালার
                    fontWeight: FontWeight.w200,
                    fontSize: 20,
                  ),
                  border: InputBorder.none,
                ),

              ),
            ),
          ],
        ),
      ),

  ),
),
      floatingActionButton: SizedBox(
        width: 153,
        height: 74,
        child: FloatingActionButton(
            onPressed: (){
              if(_taskTitleController.text.isNotEmpty){
                _taskController.AddTask(_taskTitleController.text);
              }
              Navigator.pop(context);
            },

          backgroundColor: Colors.transparent,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 7,vertical: 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors:[
                    Color(0xFFC7C723),
                    Color(0xFFB11FA8),
                  ],
                stops: [0.1,1.0],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,

              ),
              borderRadius: BorderRadius.circular(150),
            ),
            alignment: Alignment.center,
            child: Text(
              'Add Task',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF000000),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
