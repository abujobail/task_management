import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/presentation//screens/analytics_screen.dart';
import 'package:task_manager/presentation//screens/tasks_screen.dart';
// import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const colorTwo = Color(0xFF28399E);
    const colorOne = Color(0xFF0E1438);
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.topCenter,
                child: Container(
                  width: 45,
                  height: 25,
                  decoration: BoxDecoration(

                    borderRadius:BorderRadius.circular(150),
                    border: Border.all(
                      color: const Color(0xFF2F35A7),
                      width: 3,
                    ),

                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
             SizedBox(height: 14),
         Padding(
           padding: const EdgeInsets.fromLTRB(50, 10, 10, 0),

             child: Container(
               width: 136,height: 128,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(68),
                 gradient: const SweepGradient(
                   transform: GradientRotation(3.1416 *1.5),//rotate
                   colors: [
                     Color(0xFF9E2EAA),   // ১. আপনার বেগুনি কালার দিয়ে শুরু হবে
                     Color(0xFF9E2EAA),   // ২. বেগুনি কালারটি কতদূর পর্যন্ত চলবে
                     Colors.transparent,  // ৩. এখান থেকে কালারটি একদম স্বচ্ছ বা হাওয়া হয়ে যাবে
                     Colors.transparent,  // ৪. শেষ পর্যন্ত স্বচ্ছই থাকবে
                   ],
                   stops: [0.0,0.7,0.7,1.0],
                 ),
               ),
               alignment: Alignment.center,
               child: Container(
                          width: 128,height: 120,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(60),
                   image: const DecorationImage(
                     image: AssetImage('asset/jobail.png'),
                     fit: BoxFit.cover,
                   ),
               
               
                 ),
               ),
             ),

         ),
              SizedBox(height: 56),
Padding(
    padding: const EdgeInsets.only(left: 44),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
          "ABU",
        style: TextStyle(
          color: Colors.white,
          fontSize: 36,
          fontWeight: FontWeight.bold,

        ),
      ),
      Text(
        'JOBAIL',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 36,
        ),
      ),
    ],
  ),
),
              SizedBox(height: 65),
              Padding(
                  padding: EdgeInsets.only(left: 44),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context)=>const TasksScreen(),
                        ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.grid_view_rounded,
                      color: Colors.white.withOpacity(0.7),
                      ),
                      SizedBox(width: 13,),
                      Text(
                        'Categories',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                  
                    ],
                  ),
                ),
              ),
              SizedBox(height: 45,),
              Padding(
                  padding:EdgeInsets.only(left: 43),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)=>AnalyticsScreen(),
                      )

                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.bar_chart_outlined,
                      color: Colors.white.withOpacity(0.7),

                      ),
                      SizedBox(width: 24,),
                      Text(
                        "Analytics",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 24,
                        ),
                      )
                    ],
                  ),
                ),
              ),

Expanded(
  child: Align(
    alignment: Alignment.bottomLeft,
    child: Padding(
        padding:EdgeInsets.fromLTRB(34, 0, 0, 60),
    child: RichText(
      text: TextSpan(
        style: GoogleFonts.poppins(
  color: Colors.white,
        ),
  children: [
    TextSpan(
      text: 'Department of \n',
      style: GoogleFonts.poppins(
        color: Colors.white.withOpacity(0.7),
        fontSize: 24,
        fontWeight: FontWeight.w300,
      ),
    ),
    TextSpan(
        text: 'Software Engineering',
        style: GoogleFonts.poppins(
          color: Colors.lightGreen,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        )
    ),

  ]
      ),
    ),
    ),

  ),
),

            ],
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [colorOne, colorTwo],
            stops: [0.29, 0.75],
          ),
        ),
      ),
    );
  }
}
