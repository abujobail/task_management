import 'package:task_manager/data/models/task_model.dart';

class TaskController {
  //singleton
  static final TaskController _instance=TaskController._internal();//অ্যাপ যখন প্রথম রান করে, তখন মেমোরিতে একমাত্র _instance তৈরি হয়।
  factory TaskController(){//কোডের যেখানেই TaskController() লেখা হবে, এটি নতুন কোনো মেমোরি না বানিয়ে ওই একমাত্র _instance-কেই রিটার্ন করবে।
    return _instance;
  }
  TaskController._internal();//এটি হলো একটি সিক্রেট প্রাইভেট দরজা। এর কারণে বাইরের কোনো ক্লাস চাইলেও নতুন করে TaskController অবজেক্ট বানাতে পারবে না।
  final List<TaskModel>_tasks=[];//_tasks-এর আগে আন্ডারস্কোর (_) থাকার কারণে এটি প্রাইভেট। বাইরের কোনো স্ক্রিন বা ক্লাস সরাসরি _tasks.clear() বা _tasks.add() করে আসল লিস্ট নষ্ট করতে পারবে না।
  List<TaskModel>get tasks=>_tasks;//এটি হলো একটি Getter। বাইরের স্ক্রিনগুলো শুধু টাস্ক দেখানোর জন্য এই tasks দিয়ে লিস্টটি দেখতে পারবে, কিন্তু সরাসরি পরিবর্তন করতে পারবে না।
  // লাইন ৩: নতুন টাস্ক যোগ করার লজিক
  void AddTask(String title){
    final newTask= TaskModel(
        id: DateTime.now().toString(),
        title: title,
    );
    _tasks.add(newTask);
  }
  void deleteTask(String id){
    _tasks.removeWhere((task)=>task.id==id);
  }
// লাইন ৫: টাস্কের কমপ্লিট স্ট্যাটাস বদলানোর লজিক
void toggleTaskStatus(String id){
    for(var task in _tasks){
      if(task.id==id){
        task.isCompleted=! task.isCompleted;
        break;
      }
    }
}
}