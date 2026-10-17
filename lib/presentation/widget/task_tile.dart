import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1B4B).withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: ListTile(
        leading: Checkbox(
            value: task.isCompleted,
            onChanged: onChanged,
          activeColor: Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),

          ),
        ),

        title: Text(
          task.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            decoration: task.isCompleted ?
            TextDecoration.lineThrough : TextDecoration.none
          ),
          ),
        trailing: IconButton(
            onPressed: onDelete,
            icon: Icon(
              Icons.delete_outline,
              color: Colors.redAccent,
            ),
        ),
        ),
      );

  }
}
