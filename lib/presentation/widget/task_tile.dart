import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/data/models/task_model.dart';

class TaskTile extends StatelessWidget {
  final TaskModel task;
  final Function(bool?) onChanged;
  final VoidCallback onDelete;

   const TaskTile(
  {
    super.key,
    required this.task,
    required this.onChanged,
    required this.onDelete,

  }
       );

  //const TaskTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
      margin: EdgeInsets.symmetric(vertical: 13),
      decoration: BoxDecoration(
        color: const Color(0xFF0E1438), // আপনার কালার
        borderRadius: BorderRadius.circular(300), // আপনার ক্যাপসুল বর্ডার
      ),
      child: Row(
        children: [
          // ১. চেকবক্স (টিক চিহ্ন)
          IconButton(
            icon: Icon(
              task.isCompleted ? Icons.check_circle : Icons.circle_outlined,
              color: task.isCompleted ?  Colors.grey :Color(0xFFED1597) ,
            ),
            onPressed: () => onChanged(!task.isCompleted),
          ),
          const SizedBox(width: 10),

          // ২. টাস্কের নাম (আপনার Poppins ফন্ট দিয়ে)
          Expanded(
            child: Text(
              task.title, // "java backend" এর বদলে ডায়নামিক ডাটা
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w200,
                fontSize: 20,
                color: Colors.white,
                letterSpacing: 1.2,
                decoration: task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                decorationColor: Colors.purpleAccent,
                decorationThickness: 2,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // ৩. ডিলিট বাটন
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete_outline, color: Colors.yellowAccent),
          ),
        ],
      ),
    );

  }
}
