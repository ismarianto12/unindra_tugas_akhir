part of 'task_bloc.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

// class TaskSuccess extends TaskState {
//   final List<Task> task;
//   TaskSuccess({required task});
// }
