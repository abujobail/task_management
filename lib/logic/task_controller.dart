import 'package:task_manager/data/models/task_model.dart';

class TaskController {
  final List<TaskModel>_tasks=[];
  List<TaskModel>get tasks=>_tasks;
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