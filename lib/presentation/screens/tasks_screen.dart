import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/presentation//screens/add_task_screen.dart';
import 'package:task_manager/logic/task_controller.dart';
import 'package:task_manager/presentation/widget/task_tile.dart';
class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}


class _TasksScreenState extends State<TasksScreen> {


  final TaskController _taskController = TaskController();
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // decoration Container-er parameter, tai ekhane
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF46279C),
              Color(0xFF2F1A69),
              Color(0xFF5D34CF),
            ],
            stops: [0.10, 0.5, 0.8],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ---------- Top bar ----------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF000001),
                        size: 30,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            color: Color(0xFF000001),
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 40),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_none,
                            color: Color(0xFF000001),
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 41),
                Text(
                  "What's up, bro !",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
                const SizedBox(height: 37),
                Text(
                  "today's task",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                    color: const Color(0xFFCBD5CF),
                  ),
                ),
                const SizedBox(height: 60),

                //start
                Expanded(
                    child: _taskController.tasks.isEmpty?
                        Center(
                          child: Text(
                            "no task available",
                            style: GoogleFonts.poppins(
                              color: Colors.white54,
                              fontSize: 18,
                            ),
                          ),
                        )

                  :ListView.builder(
                    itemCount: _taskController.tasks.length,
                    itemBuilder:(context,index){
                      final task=_taskController.tasks[index];
                      return TaskTile(
                      task: task, onChanged: (value){
                        setState(() {
                          _taskController.toggleTaskStatus(task.id);
                        });
          },
          onDelete: (){
                        setState(() {
                          _taskController.deleteTask(task.id);
                        });
          }
          );

          }
                ),
                ),


              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: ()async{
           await Navigator.push(context,
                MaterialPageRoute(
                    builder: (context)=>AddTaskScreen()),
            );
           setState(() {

           });
          },

        backgroundColor: Colors.transparent,
        child: Container(
          width: 89,
            height: 89,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                colors: [
                  Color(0xFF243EB2),
                  Color(0xFF786C21),
                ],
                    stops: [0.3,0.7],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,

            ),
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        )
      ),
    );
  }
}

















