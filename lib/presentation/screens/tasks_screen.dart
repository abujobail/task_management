import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/presentation//screens/add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
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

                // ---------- Task 1: java backend ----------
                Container(
                  width: double.infinity,
                  height: 60,
                  padding: const EdgeInsets.fromLTRB(20, 14, 0, 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0E1438),
                    borderRadius: BorderRadius.circular(300),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_box_outlined,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 25),
                      Text(
                        "java backend",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w200,
                          fontSize: 24,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 9),

                // ---------- Task 2: flutter ----------
                Container(
                  width: double.infinity,
                  height: 60,
                  padding: const EdgeInsets.fromLTRB(20, 14, 0, 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0E1438),
                    borderRadius: BorderRadius.circular(300),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFED1597),
                            width: 4,
                          ),
                        ),
                      ),
                      const SizedBox(width: 25),
                      Text(
                        "flutter",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w200,
                          fontSize: 24,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context)=>AddTaskScreen()),
            );
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